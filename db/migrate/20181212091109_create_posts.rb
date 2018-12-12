class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image_url
      t.string :product1_url
      t.string :product2_url
      t.string :product3_url
      t.string :product4_url
      t.string :product5_url

      t.timestamps
    end
  end
end
