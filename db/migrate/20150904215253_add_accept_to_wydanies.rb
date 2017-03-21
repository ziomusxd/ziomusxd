class AddAcceptToWydanies < ActiveRecord::Migration
  def change
    add_column :wydanies, :accept, :boolean
  end
end
