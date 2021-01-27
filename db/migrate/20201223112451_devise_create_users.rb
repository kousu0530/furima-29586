class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_name_kana, null: false 
      t.string :first_name_kana,null: false
      t.string :nickname, null: false, default: ""
      t.date :birthday, null: false 
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
 
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
 
      ## Rememberable
      t.datetime :remember_created_at
 
      # 省略
 
      t.timestamps null: false
    end
 
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
 end
