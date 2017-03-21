class AddAcceptedIdToWydanies < ActiveRecord::Migration
  def change
    add_column :wydanies, :accept_id, :integer
  end
end
