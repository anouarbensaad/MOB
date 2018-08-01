class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :utype
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :login
    add_index :users, :email, unique: true
  end
end
