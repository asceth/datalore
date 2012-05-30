class Template < ActiveRecord::Base
  belongs_to :report
  has_many :template_fields

  accepts_nested_attributes_for :template_fields

  attr_accessor :error

  def to_s
    name
  end

  def to_arel
    query = report.to_arel

    # add in filters
    query = template_fields.filterable.inject(query) do |arel, field|
      field.to_arel_where(arel)
    end

    # add in group
    template_fields.groupable.each do |group|
      query = query.group(group.to_arel_column)
    end

    # add in field output
    if template_fields.displayable.empty?
      query.project(['no_fields'])
    else
      query.project(template_fields.displayable.map(&:to_arel_column))
    end
  end

  def result
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
