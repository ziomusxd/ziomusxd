class ZmianaIlosciStringInteger < ActiveRecord::Migration
  def up
      change_column :explos, :quantity, :integer
    end

    def down
      change_column :explos, :quantity, :string
    end
end
