class AddReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.timestamps
    end

    create_table :joins do |t|
      t.belongs_to :report
      t.boolean :root

      t.string :primary_table_name
      t.string :primary_key

      t.string :foreign_table_name
      t.string :foreign_key

      t.timestamps
    end

    create_table :fields do |t|
      t.belongs_to :report

      t.boolean :filterable
      t.boolean :displayable
      t.boolean :groupable

      t.string :table_name
      t.string :column_name

      t.string :modifier
      t.timestamps
    end
  end
end
