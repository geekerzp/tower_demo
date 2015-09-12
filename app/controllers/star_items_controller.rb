class StarItemsController < ApplicationController
  before_action :set_star_item, only: [:show, :edit, :update, :destroy]

  # GET /star_items
  # GET /star_items.json
  def index
    @star_items = StarItem.all
  end

  # GET /star_items/1
  # GET /star_items/1.json
  def show
  end

  # GET /star_items/new
  def new
    @star_item = StarItem.new
  end

  # GET /star_items/1/edit
  def edit
  end

  # POST /star_items
  # POST /star_items.json
  def create
    @star_item = StarItem.new(star_item_params)

    respond_to do |format|
      if @star_item.save
        format.html { redirect_to @star_item, notice: 'Star item was successfully created.' }
        format.json { render :show, status: :created, location: @star_item }
      else
        format.html { render :new }
        format.json { render json: @star_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /star_items/1
  # PATCH/PUT /star_items/1.json
  def update
    respond_to do |format|
      if @star_item.update(star_item_params)
        format.html { redirect_to @star_item, notice: 'Star item was successfully updated.' }
        format.json { render :show, status: :ok, location: @star_item }
      else
        format.html { render :edit }
        format.json { render json: @star_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /star_items/1
  # DELETE /star_items/1.json
  def destroy
    @star_item.destroy
    respond_to do |format|
      format.html { redirect_to star_items_url, notice: 'Star item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star_item
      @star_item = StarItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def star_item_params
      params[:star_item]
    end
end
