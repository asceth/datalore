class AddReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.string :category

      t.timestamps
    end

    create_table :report_associations do |t|
      t.belongs_to :report
      t.boolean :root, :default => false

      t.string :primary_table_name
      t.string :primary_key

      t.string :foreign_table_name
      t.string :foreign_key

      t.timestamps
    end

    create_table :report_metrics do |t|
      t.belongs_to :report

      t.integer :position # columns

      # filters
      t.boolean :locked

      t.string :function
      t.string :operator
      t.string :value
      # end filters


      t.string :name
      t.string :table_name
      t.string :column_name
      t.string :metric_type # column, filter, group

      t.timestamps
    end

    create_table :templates do |t|
      t.belongs_to :report

      t.string :name

      t.string :hidden_columns

      t.timestamps
    end

    create_table :template_metrics do |t|
      t.belongs_to :template
      t.belongs_to :report_metric

      t.string :function
      t.string :operator
      t.string :value

      t.timestamps
    end
  end
end
