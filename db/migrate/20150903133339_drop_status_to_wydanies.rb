class DropStatusToWydanies < ActiveRecord::Migration
  def change
    remove_column :wydanies, :status
  end
end
