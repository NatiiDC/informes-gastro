class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :name
      t.string :type
      t.date :date
      t.string :reason
      t.string :report
      t.string :conclusion
      t.string :diagnostic

      t.references :patient, index: true

      t.timestamps null: false
    end
  end
end
