class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string :name,                      null: false                    
      t.text :explanation,                 null: false                     
      t.integer :category_id,              null: false                    
      t.integer :scheduled_state_id,       null: false                    
      t.integer :shipping_charge_id,       null: false                     
      t.integer :prefecture_id,            null: false                    
      t.integer :scheduled_day_id,         null: false                     
      t.integer :price,                    null: false                    
      t.references :user,                  null: false, foreign_kye: true 
      t.timestamps
    end
  end
end
