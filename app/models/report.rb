class Report < ActiveRecord::Base
  has_many :report_associations
  has_many :report_metrics
  has_many :templates

  accepts_nested_attributes_for :report_associations
  accepts_nested_attributes_for :report_metrics

  def to_s
    name
  end

  def to_arel
    report_associations.branches.inject(report_associations.root.first.primary_table) do |query, association|
      association.with(query)
    end
  end

  def tables
    @tables ||= report_associations.map(&:foreign_table_name).uniq
  end

  # used to build a template with appropriate template metrics
  def build_default_template
    templates.build.tap do |template|
      report_metrics.filters.each do |metric|
        template.template_metrics.build(:report_metric => metric)
      end
    end
  end


  module ConceptsMethods
    def concepts
      @concepts || {}
    end

    def conceptualize(value)
      (@concepts || {}).merge(value) if value.is_a?(Hash)
    end
  end
  include ConceptsMethods

  module ClassMethods
    def tables
      ActiveRecord::Base.connection.tables.sort
    end

    def table_columns(table_name)
      return [] if table_name.blank? # rails returns true for blank on table_exists?

      if ActiveRecord::Base.connection.table_exists?(table_name)
        ActiveRecord::Base.connection.columns(table_name).map(&:name)
      else
        []
      end
    end
  end
  extend ClassMethods
end
