class Report < ActiveRecord::Base
  has_many :joins
  has_many :fields

  has_many :templates

  accepts_nested_attributes_for :joins
  accepts_nested_attributes_for :fields

  def to_s
    name
  end

  def to_arel
    joins.branches.inject(joins.root.first.foreign_table) do |query, join|
      join.with(query)
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
      Arel::Table.new(table_name).try(:columns).map(&:name) || []
    end
  end
  extend ClassMethods
end
