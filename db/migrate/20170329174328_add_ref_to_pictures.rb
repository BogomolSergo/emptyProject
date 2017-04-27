class AddRefToPictures < ActiveRecord::Migration
  def change
    add_column :images, :pmimage_id, :integer
    add_column :images, :pmimage_type, :string
  end
end
