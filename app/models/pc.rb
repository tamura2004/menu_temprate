class Pc < ActiveRecord::Base
  has_many :items
  has_one :race
end
