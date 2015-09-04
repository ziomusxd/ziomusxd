class AddStatusToWydanies < ActiveRecord::Migration
  def change
    add_column :wydanies, :status, :string
  end
end
