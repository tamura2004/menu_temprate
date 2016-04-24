class Item < ActiveRecord::Base
  belongs_to :pc
  belongs_to :item_master
end
