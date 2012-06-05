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

    add_index :report_associations, [:report_id]


    create_table :report_metrics do |t|
      t.belongs_to :report

      # output
      t.integer :position
      t.boolean :hidden
      # end output


      # filters
      t.boolean :locked

      t.string :function
      t.string :operator
      t.string :value
      # end filters


      t.string :name
      t.string :table_name
      t.string :column_name
      t.string :metric_type # output, filter, group

      t.timestamps
    end

    add_index :report_metrics, [:report_id]


    create_table :templates do |t|
      t.belongs_to :report

      t.string :name

      t.string :hidden_columns

      t.timestamps
    end

    add_index :templates, [:report_id]


    create_table :template_metrics do |t|
      t.belongs_to :template
      t.belongs_to :report_metric

      t.string :function
      t.string :operator
      t.string :value

      t.timestamps
    end

    add_index :template_metrics, [:template_id]
    add_index :template_metrics, [:report_metric_id]
  end
end
