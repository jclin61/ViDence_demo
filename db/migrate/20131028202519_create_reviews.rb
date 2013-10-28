class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.text :tags
      t.references :user, index: true
      t.references :camera, index: true

      t.timestamps
    end
  end
end
