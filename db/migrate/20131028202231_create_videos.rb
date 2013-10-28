class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.text :link
      t.string :location
      t.integer :rating
      t.text :tags
      t.references :user, index: true
      t.references :category, index: true
      t.references :camera, index: true

      t.timestamps
    end
  end
end
