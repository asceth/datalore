class Field < ActiveRecord::Base
  belongs_to :report

  scope :filterable, where(:filterable => true)
  scope :displayable, where(:displayable => true)
  scope :groupable, where(:groupable => true)

  def to_s
    "#{name} (#{table_name}.#{column_name})"
  end

  def to_fake_sql
    "#{table_name}.#{column_name}"
  end
end


