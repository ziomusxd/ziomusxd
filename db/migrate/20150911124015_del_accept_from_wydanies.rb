class DelAcceptFromWydanies < ActiveRecord::Migration
  def change
        remove_column :wydanies, :accept
  end
end
