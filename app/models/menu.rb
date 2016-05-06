class Menu < ActiveRecord::Base
  belongs_to :parent,  class_name: "Menu", foreign_key: "menu_id"
  has_many :menus, class_name: "Menu", foreign_key: "menu_id"

  attr_accessor :pos

  def children
    name == "items" ? ItemMaster.all : menus
  end

  def left
    Menu.left(id).tap do |m|
      m.pos = :left
    end
  end

  def right
    Menu.right(id).tap do |m|
      m.pos = :right
    end
  end

  def center
    tap do |m|
      m.pos = :center
    end
  end

  def sight
    [left,center,right]
  end

  def label
    name.sub(/wall/,"---")
  end

  scope :right, ->(id){ where("id > ?", id).first || wall }
  scope :left, ->(id){ where("id < ?", id).last || wall }

  scope :wall, ->{ find_by(name: "wall") }

  def view_class
    "b200 btn btn-default btn-lg" + if name == "wall" then " disabled" else "" end
  end

end
