class AddLoginToAdmin < ActiveRecord::Migration
  def change
  	add_column :admins, :login, :string, :null => false, :default => "", :unique => true
    add_index :admins, :login, :unique => true
  end
end
