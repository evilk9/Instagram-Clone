class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|

      t.text :description

      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at 

      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
