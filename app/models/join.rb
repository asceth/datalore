class Join < ActiveRecord::Base
  belongs_to :report

  def to_s
    if root?
      "#{primary_table_name}"
    else
      "#{primary_table_name}.#{primary_key} = #{foreign_table_name}.#{foreign_key}"
    end
  end
end
