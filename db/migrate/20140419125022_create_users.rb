class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.date :birthdate
      t.string :roles, :array => true, :default => '{}'
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
