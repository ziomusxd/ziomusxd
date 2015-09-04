class ChangequantitytypeInAdoption < ActiveRecord::Migration
  def up
      change_column :adoptions, :quantity, :integer
    end

    def down
      change_column :adoptions, :quantity, :string
    end
end
