class MenusController < ApplicationController
  before_action :set_menu, only: [:index, :show, :edit, :update, :destroy]
  before_action :random_encounter

  def index
    render :show
  end

  def show
    @menus = @menu.sight
  end

  def update
    @menus = @menu.sight
    render :show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      id = params[:id]
      @menu = Menu.find(id)
    end

    def random_encounter
    end


end
