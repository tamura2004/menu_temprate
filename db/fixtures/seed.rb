# rails g scaffold pc name gp
# rails g model item_master name gp
# rails g scaffold item pc:references item_master:references
# rails g scaffold menu name controller action menu:references

# rails g bootstrap:install less
# rails g bootstrap:layout application fluid -f
# rails g simple_form:install --bootstrap

# rails g bootstrap:themed pcs
# rails g bootstrap:themed items
# rails g bootstrap:themed menus

require "yaml"

menu = YAML.load (<<MENU)
---
world:
  field:
    town: &town
      shop:
        buy: new_item
      training:
        list: pcs
        make: new_pc
    first_town: *town
    second_town: *town
    third_town: *town
  battle:
    attack: battle_attack
    escape: battle_escape
MENU

class MenuFactory
  attr_accessor :menus

  def initialize
    @id = 0
    # @menus = []
  end

  def create(hash,parent)
    hash.each do |entry,children|
      @id += 1

      case children
      when Hash
        # @menus << [@id, parent, entry, nil]
        Menu.seed do |s|
          s.id = @id
          s.name = entry
          s.menu_id = parent
          s.path = nil
        end
        create(children,@id)

      when String
        Menu.seed do |s|
          s.id = @id
          s.name = entry
          s.menu_id = parent
          s.path = children
        end
        # @menus << [@id, parent, entry, v]
      end
    end
  end
end

f = MenuFactory.new
f.create(menu,nil)

ItemMaster.seed do |s|
  s.id = 0
  s.name = "dagger"
  s.gp = 20
end
ItemMaster.seed do |s|
  s.id = 1
  s.name = "potion"
  s.gp = 100
end

Pc.seed do |s|
  s.id = 0
  s.name = "bob"
  s.gp = 150
end



