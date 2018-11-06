class CreateInspections < ActiveRecord::Migration[4.2]
  def change
    create_table :inspections do |t|
      t.string :study_of_name
      t.string :study_of_type
      t.date :date
      t.string :reason
      t.text :conclusion
      t.string :diagnostic
      t.text :stomach
      t.text :esophagus
      t.text :duodenum
      t.text :colonoscopy
      t.text :rectal_examination

      t.references :patient, index: true

      t.timestamps null: false
    end
  end
end
