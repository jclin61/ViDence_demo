class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.references :association, polymorphic: true, index: true

      t.timestamps
    end
  end
end
