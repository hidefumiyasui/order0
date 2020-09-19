class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text	 :explanation
      t.integer :price
      t.string :image
      t.references :genre
      t.timestamps
    end
  end
end
