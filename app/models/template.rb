class Template < ActiveRecord::Base
  belongs_to :report
  has_many :template_metrics

  accepts_nested_attributes_for :template_metrics

  attr_accessor :error

  def to_s
    name
  end

  def to_arel
    query = report.to_arel

    # add in unlocked filters
    query = template_metrics.filters.unlocked.inject(query) do |arel, filter|
      filter.to_arel_where(arel)
    end

    # add in locked filters
    report.report_metrics.locked.each do |filter|
      query = filter.to_arel_where(query)
    end

    # add in groups
    report.report_metrics.groups.each do |group|
      query = query.group(group.to_arel_group)
    end

    # add in outputs
    if report.report_metrics.outputs.empty?
      query.project(['no_fields'])
    else
      query.project(report.report_metrics.outputs.map(&:to_arel_column))
    end
  end

  # regardless of the adapter return an array of hashes where the hash
  # uses  "column name" => value
  def rows
    @rows ||= if ActiveRecord::Base.connection.adapter_name == "PostgreSQL"
                result.entries
              else
                [].tap do |row_hashes|
                  result.entries.map do |row|
                    hash = {}
                    result.fields.each do |field|
                      hash[field] = row[result.fields.index(field)]
                    end
                    row_hashes << hash
                  end
                end
              end
  end

  def result(concepts = {})
    report.conceptualize(concepts)
    begin
      @result ||= ActiveRecord::Base.connection.execute(to_arel.take(5).to_sql)
    rescue Exception => e
      @error = e
    end
  end

  def error?
    result
    return true if @result.nil?
    return false
  end
end
