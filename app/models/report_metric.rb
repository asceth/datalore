class ReportMetric < ActiveRecord::Base
  belongs_to :report

  scope :outputs, where(:metric_type => 'output')
  scope :filters, where(:metric_type => 'filter')
  scope :groups, where(:grouped => true)

  scope :ruby_groups, where(:metric_type => 'group')

  scope :locked, where(:locked => true)
  scope :unlocked, where(:locked => false)


  def to_s
    "#{name} (#{table_name}.#{column_name})"
  end

  def to_fake_sql(template_metric = nil)
    func = template_metric.try(:function) || function
    op = template_metric.try(:operator) || operator
    val = template_metric.try(:value) || value


    if func.blank?
      "#{table_name}.#{column_name}"
    else
      "#{func}(#{table_name}.#{column_name})"
    end
  end

  def to_function(template_metric = nil)
    template_metric.try(:function) || function
  end

  def to_operator(template_metric = nil)
    template_metric.try(:operator) || operator
  end

  def to_value(template_metric = nil)
    template_metric.try(:value) || parse_concepts(value)
  end

  def parse_concepts(val)
    report.concepts.each do |concept, value|
      val = val.gsub("[#{concept}]", value)
    end
  end

  #
  # Arel Helpers
  #
  def to_as
    "#{table_name}_#{column_name}"
  end

  def to_arel_where(arel, template_metric = nil)
    [to_operator(template_metric), to_value(template_metric)].let do |(op, val)|
      if op.blank? || val.blank?
        arel
      else
        arel.where(to_arel_column(template_metric).send(op, val))
      end
    end
  end

  def to_arel_group(template_metric = nil)
    to_arel_table[column_name].let do |col|
      if to_function(template_metric).blank?
        col
      else
        col.send(function)
      end
    end
  end

  def to_arel_column(template_metric = nil)
    to_arel_group(template_metric).let do |col|
      if output?
        col.as(self.to_as)
      else
        col
      end
    end
  end

  def to_arel_table
    Arel::Table.new(table_name)
  end


  #
  # Class Methods
  #
  module ClassMethods
    def metric_types
      ['output', 'filter', 'group']
    end

    def operators
      Arel::Predications.instance_methods - Module.instance_methods
    end

    def functions
      Arel::Expressions.instance_methods - Module.instance_methods
    end
  end
  extend ClassMethods

  #
  # Metric Type Helpers
  #
  metric_types.each do |metric_type|
    define_method("#{metric_type}?") do
      self[:metric_type] == metric_type
    end
  end
end


