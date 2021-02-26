class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
    end

  end
end
