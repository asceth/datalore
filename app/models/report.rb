class Report < ActiveRecord::Base
  has_many :joins
  has_many :fields

  accepts_nested_attributes_for :joins
  accepts_nested_attributes_for :fields


  def to_s
    name
  end

  module ClassMethods
    def tables
      ActiveRecord::Base.connection.tables
    end
  end
  extend ClassMethods
end
