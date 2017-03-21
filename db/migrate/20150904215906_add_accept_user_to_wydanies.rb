class AddAcceptUserToWydanies < ActiveRecord::Migration
  def change
    add_column :wydanies, :accept_user, :string
  end
end
