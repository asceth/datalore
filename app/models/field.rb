class Field < ActiveRecord::Base
  belongs_to :report

  scope :filterable, where(:filterable => true)
  scope :displayable, where(:displayable => true)
  scope :groupable, where(:groupable => true)

  def to_s
    "#{table_name}.#{column_name}"
  end

  def possible_columns
    Arel::Table.new(table_name).try(:columns).map(&:name) || []
  end
end


