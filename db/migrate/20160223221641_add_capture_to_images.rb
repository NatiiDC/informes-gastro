class AddCaptureToImages < ActiveRecord::Migration[4.2]
  def change
    add_column :images, :capture, :string
  end
end
