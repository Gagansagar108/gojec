class CreateGojecUsersTable < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :encrypted_password
      t.boolean :status
      t.timestamps
    end

    create_table :user_sessions do |t|
      t.references :user
      t.string :key 
      t.boolean :status
      t.timestamps
    end

  
    create_table :payments do |t|
      t.references :user
      t.integer :provider 
      t.integer :status
      t.string :order_id
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
