class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :cam_name
      t.text :cam_description
      t.text :cam_pictures
      t.references :video, index: true
      t.references :review, index: true

      t.timestamps
    end
  end
end
