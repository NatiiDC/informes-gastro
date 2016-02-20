class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :study_of_name
      t.string :study_of_type
      t.date :date
      t.string :reason
      t.string :report
      t.string :conclusion
      t.string :diagnostic
      t.string :stomach
      t.string :esophagus
      t.string :duodenum

      t.references :patient, index: true

      t.timestamps null: false
    end
  end
end
