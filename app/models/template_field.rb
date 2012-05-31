class TemplateField < ActiveRecord::Base
  belongs_to :template
  belongs_to :field

  scope :filterable, where(:field_type => 0)
  scope :displayable, where(:field_type => 1)
  scope :groupable, where(:field_type => 2)

  def to_s
    field.to_s
  end

  def to_fake_sql
    field.to_fake_sql.let do |fake_field|
      if function.blank?
        "#{fake_field}"
      else
        "#{function}(#{fake_field})"
      end
    end
  end

  #
  # Arel Helpers
  #
  def to_as
    "#{field.table_name}_#{field.column_name}"
  end

  def to_arel_where(arel)
    arel.where(to_arel_column.send(operator, value))
  end

  def to_arel_column
    Arel::Table.new(field.table_name)[field.column_name].let do |col|
      if function.blank?
        col
      else
        col.send(function)
      end.let do |col|
        if displayable?
          col.as(self.to_as)
        else
          col
        end
      end
    end
  end


  #
  # Field Types
  #
  def filterable?
    field_type == self.class.field_types[:filterable]
  end

  def displayable?
    field_type == self.class.field_types[:displayable]
  end

  def groupable?
    field_type == self.class.field_types[:groupable]
  end

  def field_types
    types = self.class.field_types.dup

    types.delete(:filterable) unless field.filterable?
    types.delete(:displayable) unless field.displayable?
    types.delete(:groupable) unless field.groupable?

    types
  end


  #
  # Class Methods
  #
  module ClassMethods
    def field_types
      {
        :filterable => 0,
        :displayable => 1,
        :groupable => 2
      }
    end

    def operators
      Arel::Predications.instance_methods - Module.instance_methods
    end

    def functions
      Arel::Expressions.instance_methods - Module.instance_methods
    end
  end
  extend ClassMethods
end


