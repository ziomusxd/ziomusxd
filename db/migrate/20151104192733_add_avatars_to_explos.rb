class AddAvatarsToExplos < ActiveRecord::Migration
  def self.up
      change_table :explos do |t|
        t.attachment :avatar
      end
    end

    def self.down
      drop_attached_file :explos, :avatar
    end
end
