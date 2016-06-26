class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :tel
      t.string :email

      t.timestamps null: false
    end
  end
end
