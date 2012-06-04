class Report < ActiveRecord::Base
  has_many :report_metrics
  has_many :associations, :through => :report_metrics
  has_many :templates

  accepts_nested_attributes_for :report_metrics

  serialize :joins

  def to_s
    name
  end

  def to_arel
    # tree
    root = report_metrics.initial.first.table

    associations.uniq_by {|as| [as.primary_table_name, as.foreign_table_name]}.inject(root) do |query, assoc|
      query.join(
    end
  end

  def to_arel_recurse(query, tables)
    tables.inject(query) do |query, table, children|
      query.
      to_arel_recurse(query,
    end
  end

  def tables
    @tables ||= joins.map(&:foreign_table_name).uniq
  end

  module ClassMethods
    def tables
      ActiveRecord::Base.connection.tables
    end

    def table_columns(table_name)
      return [] if table_name.blank?

      Arel::Table.new(table_name).try(:columns).map(&:name) || []
    end
  end
  extend ClassMethods
end
