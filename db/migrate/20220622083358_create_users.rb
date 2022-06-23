class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 50
      t.string :cellphone, limit: 20
      t.string :email, limit: 100
      t.string :password, limit: 50

      t.timestamps
    end
    add_column :users, :role, :string, limit: 25, default: "User"
    add_index :users, :email, unique: true
  end
end
