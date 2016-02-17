class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.string :firstname
      t.string :lastname
      t.string :type_document_cd
      t.integer :document_number
      t.date :birthdate
      t.string :nationality
      t.string :gender_cd
      t.string :obra_social_type
      t.string :obra_social_number
      t.string :phone
      t.string :observations

      t.timestamps null: false
    end
  end
end
