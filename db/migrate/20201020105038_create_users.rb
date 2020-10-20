class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.boolean :admin, default: false
      t.boolean :logged_in

      t.timestamps
    end
  end
end
