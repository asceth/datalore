class AddReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.timestamps
    end

    create_table :joins do |t|
      t.belongs_to :report
      t.boolean :root, :default => false

      t.string :primary_table_name
      t.string :primary_key

      t.string :foreign_table_name
      t.string :foreign_key

      t.timestamps
    end

    create_table :fields do |t|
      t.belongs_to :report

      t.boolean :filterable, :default => false
      t.boolean :displayable, :default => false
      t.boolean :groupable, :default => false

      t.string :name

      t.string :table_name
      t.string :column_name

      t.timestamps
    end

    create_table :templates do |t|
      t.belongs_to :report

      t.string :name

      t.timestamps
    end

    create_table :template_fields do |t|
      t.belongs_to :template
      t.belongs_to :field

      t.integer :field_type

      # when displaying
      t.integer :position
      t.string :name

      # when filtering or grouping
      t.string :function

      # when filtering
      t.string :value
      t.string :operator

      t.timestamps
    end
  end
end
