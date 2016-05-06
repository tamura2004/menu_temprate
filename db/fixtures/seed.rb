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

Menu.delete_all

menus = YAML.load (<<MENU)
---
- wall:
- wall:
- town: inn
- field:
- dungeon: dungeon_level_1
- wall:
- wall:
- inn:
- shop:
- temple:
- dungeon_level_1:
- dungeon_level_2:
- dungeon_level_3:
- wall:
- wall:
MENU

@id = -1
def id
  @id += 1
end

menus.each do |menu|
  menu.each do |k,v|
    Menu.seed do |s|
      s.id = id
      s.name = k
      s.path = v
    end
  end
end

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



