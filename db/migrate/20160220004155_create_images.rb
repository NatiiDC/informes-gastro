class CreateImages < ActiveRecord::Migration[4.2]
  def change
    create_table :images do |t|

      t.string :name,         :null => false

      t.references :inspection, index: true
      t.timestamps null: false
    end
  end
end
