class TemplateMetric < ActiveRecord::Base
  belongs_to :template
  belongs_to :report_metric

  scope :outputs, joins(:report_metric).where('report_metrics.metric_type' => 'output')
  scope :filters, joins(:report_metric).where('report_metrics.metric_type' => 'filter')
  scope :groups, joins(:report_metric).where('report_metrics.grouped' => true)

  scope :unlocked, joins(:report_metric).where('report_metrics.locked' => false)

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
  #  delegates to report_metric
  #
  def to_arel_where(arel)
    report_metric.to_arel_where(arel, self)
  end

  def to_arel_column
    report_metric.to_arel_column(self)
  end

  def to_arel_group
    report_metric.to_arel_group(self)
  end

  def nilify_blank_columns
    self[:function] = nil if function.blank?
    self[:operator] = nil if operator.blank?
    self[:value] = nil if value.blank?
  end
end


