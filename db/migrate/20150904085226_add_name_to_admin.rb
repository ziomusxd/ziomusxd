class AddNameToAdmin < ActiveRecord::Migration
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :surname, :string
    add_column :admin_users, :adres, :string
    add_column :admin_users, :tel, :integer

  end
end
