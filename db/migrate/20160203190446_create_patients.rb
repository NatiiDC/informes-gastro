class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|

      t.string :firstname
      t.string :lastname
      t.string :type_document_cd
      t.integer :document_number
      t.string :observations

      t.timestamps null: false
    end
  end
end
