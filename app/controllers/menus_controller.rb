class MenusController < ApplicationController
  before_action :set_menu, only: [:index, :show, :edit, :update, :destroy]

  def index
    p @menu
    p @menu.children
    render :show
  end

  def show
    if rand(10) < 3
      flash[:alert] = "enemy attack you!"
      redirect_to menu_url(Menu.find_by(name: "battle"))
    else
      if @menu.path
        redirect_to eval(@menu.path+"_url")
      elsif @menu.name !~ /battle/i
        session[:menu_id] = @menu.id
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      id = params[:id] || session[:menu_id] || 1
      @menu = Menu.find(id)
    end

end
