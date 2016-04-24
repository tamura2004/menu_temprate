class BattleController < ApplicationController
  def attack
    case rand(3)
    when 0
      flash[:alert] = "you are died"
      redirect_to :menus

    when 1
      flash[:notice] = "fighting..."
      menu = Menu.find_by(name: "battle")
      redirect_to menu_url(menu.id)

    when 2
      flash[:notice] = "victory!"
      redirect_to :menus
    end
  end

  def escape
    case rand(3)
    when 0
      flash[:alert] = "you are died"
      redirect_to :menus

    when 1
      flash[:notice] = "fighting..."
      menu = Menu.find_by(name: "battle")
      redirect_to menu_url(menu.id)

    when 2
      flash[:notice] = "victory!"
      redirect_to :menus
    end
  end
end
