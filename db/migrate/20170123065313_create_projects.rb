class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      
        t.string :title
        t.string :img_url
        t.string :detail
        t.integer :price
        t.date :deadline
        t.integer :num_peo
        t.string :total_peo
        t.integer :user_id

      t.timestamps null: false
    end
  end
end
