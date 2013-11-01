class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.string :contact
      t.string :location
      t.references :user, index: true

      t.timestamps
    end
  end
end
