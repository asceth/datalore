class TemplateMetric < ActiveRecord::Base
  belongs_to :template
  belongs_to :report_metric

  scope :columns, join(:report_metric).where('report_metric.metric_type' => 'column')
  scope :filters, join(:report_metric).where('report_metric.metric_type' => 'filter')
  scope :groups, join(:report_metric).where('report_metric.metric_type' => 'group')

  before_save :nilify_blank_columns

  def to_s
    report_metric.to_s
  end

  def to_fake_sql
    report_metric.to_fake_sql.let do |fake_report_metric|
      if function.blank?
        "#{fake_report_metric}"
      else
        "#{function}(#{fake_report_metric})"
      end
    end
  end

  #
  # Arel Helpers
  #


  def to_arel_where(arel)
    arel.where(to_arel_column.send(operator, value))
  end

  def to_arel_column

  end

  def nilify_blank_columns
    self[:function] = nil if function.blank?
    self[:operator] = nil if operator.blank?
    self[:value] = nil if value.blank?
  end
end


