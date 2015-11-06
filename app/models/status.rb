class Status < ActiveRecord::Base
  has_many :accident
  has_many :wz
  has_many :action
end
