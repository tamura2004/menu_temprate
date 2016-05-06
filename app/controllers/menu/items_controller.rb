class Menu::ItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  # GET /menu/items
  # GET /menu/items.json
  def index
    @menu_items = Menu::Item.all
  end

  # GET /menu/items/1
  # GET /menu/items/1.json
  def show
  end

  # GET /menu/items/new
  def new
    @menu_item = Menu::Item.new
  end

  # GET /menu/items/1/edit
  def edit
  end

  # POST /menu/items
  # POST /menu/items.json
  def create
    @menu_item = Menu::Item.new(menu_item_params)

    respond_to do |format|
      if @menu_item.save
        format.html { redirect_to @menu_item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @menu_item }
      else
        format.html { render :new }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu/items/1
  # PATCH/PUT /menu/items/1.json
  def update
    respond_to do |format|
      if @menu_item.update(menu_item_params)
        format.html { redirect_to @menu_item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_item }
      else
        format.html { render :edit }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu/items/1
  # DELETE /menu/items/1.json
  def destroy
    @menu_item.destroy
    respond_to do |format|
      format.html { redirect_to menu_items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_item
      @menu_item = Menu::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_item_params
      params.fetch(:menu_item, {})
    end
end
