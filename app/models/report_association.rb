class ReportAssociation < ActiveRecord::Base
  belongs_to :report

  scope :root, where(:root => true)
  scope :branches, where(:root => false)

  before_create :set_primary_table_if_root

  def to_s
    if root?
      "#{foreign_table_name}"
    else
      "#{primary_table_name}.#{primary_key} = #{foreign_table_name}.#{foreign_key}"
    end
  end

  def foreign_tables
    (Report.tables - report.tables + [foreign_table_name]).reject(&:blank?)
  end

  def with(arel)
    arel.join(foreign_table).on(primary_table[primary_key].eq(foreign_table[foreign_key]))
  end

  def primary_table
    @primary_table ||= Arel::Table.new(primary_table_name)
  end

  def foreign_table
    @foreign_table ||= Arel::Table.new(foreign_table_name)
  end

  private

  def set_primary_table_if_root
    self.primary_table_name = self.foreign_table_name if root?
  end
end
