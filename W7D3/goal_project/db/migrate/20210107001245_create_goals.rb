class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.integer :user_id , null: false 
      t.text :details , null: false
      t.boolean :status ,null: false , inclusion: {status: [ true, false ]}

      t.timestamps
    end
    add_index :goals, :name 
    add_index :goals, :user_id
  end
end
