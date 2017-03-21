class AddAvatarwToCategory < ActiveRecord::Migration
  def self.up
      add_column :categories, :avatar_file_name, :string
      add_column :categories, :avatar_content_type, :string
      add_column :categories, :avatar_file_size, :integer
      add_column :categories, :avatar_updated_at, :datetime
    end

    def self.down
      remove_column :categories, :avatar_updated_at
      remove_column :categories, :avatar_file_name
      remove_column :categories, :avatar_content_type
      remove_column :categories, :avatar_file_size
    end
    
end
