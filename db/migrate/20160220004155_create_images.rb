class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|

      t.string :name,         :null => false
      t.binary :data,         :null => false
      t.string :filename
      t.string :mime_type

      t.references :inspection, index: true
      t.timestamps null: false
    end
  end
end
