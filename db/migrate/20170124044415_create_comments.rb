class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.string :comments
      t.integer :user_id
      t.integer :project_id
      
      t.timestamps null: false
    end
  end
end
