class AddCaptureToImages < ActiveRecord::Migration
  def change
    add_column :images, :capture, :string
  end
end
