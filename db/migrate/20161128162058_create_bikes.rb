class CreateBikes < ActiveRecord::Migration[5.0]
  def change
    create_table :bikes do |t|
      t.string :kind
      t.string :brand
      t.boolean :electric , default: false
      t.integer :autonomy
      t.string :city
      t.boolean :available, default: true
      t.string :title
      t.text :detail
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
