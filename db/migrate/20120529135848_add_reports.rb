class AddReports < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :name
      t.string :category

      t.boolean :initial

      t.string :table_name
      t.string :column_name

      t.timestamps
    end

    create_table :associations do |t|
      t.belongs_to :report
      t.belongs_to :association

      t.string :name

      t.string :primary_table_name
      t.string :primary_key

      t.string :foreign_table_name
      t.string :foreign_key

      t.timestamps
    end

    create_table :reports do |t|
      t.string :name
      t.string :category

      t.text :joins

      t.timestamps
    end

    create_table :report_metrics do |t|
      t.belongs_to :report
      t.belongs_to :metric
      t.belongs_to :association


      t.integer :position # columns

      t.integer :metric_type # column, filter, group

      # filters
      t.boolean :locked

      t.string :function
      t.string :operator
      t.string :value
      # end filters


      t.string :name

      t.timestamps
    end

    create_table :templates do |t|
      t.belongs_to :report

      t.string :name

      t.string :hidden_columns

      t.timestamps
    end

    create_table :template_filters do |t|
      t.belongs_to :template
      t.belongs_to :report_filter

      t.string :function
      t.string :operator
      t.string :value

      t.timestamps
    end
  end
end
