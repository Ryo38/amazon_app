class AsinsController < ApplicationController
  before_action :set_asin, only: [:show, :edit, :update, :destroy]

  # GET /asins
  # GET /asins.json
  def index
    @asins = Asin.all
  end

  # GET /asins/1
  # GET /asins/1.json
  def show
  end

  # GET /asins/new
  def new
    @asin = Asin.new
  end

  # GET /asins/1/edit
  def edit
  end

  # POST /asins
  # POST /asins.json
  def create
    @asin = Asin.new(asin_params)

    respond_to do |format|
      if @asin.save
        format.html { redirect_to @asin, notice: 'Asin was successfully created.' }
        format.json { render :show, status: :created, location: @asin }
      else
        format.html { render :new }
        format.json { render json: @asin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asins/1
  # PATCH/PUT /asins/1.json
  def update
    respond_to do |format|
      if @asin.update(asin_params)
        format.html { redirect_to @asin, notice: 'Asin was successfully updated.' }
        format.json { render :show, status: :ok, location: @asin }
      else
        format.html { render :edit }
        format.json { render json: @asin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asins/1
  # DELETE /asins/1.json
  def destroy
    @asin.destroy
    respond_to do |format|
      format.html { redirect_to asins_url, notice: 'Asin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asin
      @asin = Asin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asin_params
      params.require(:asin).permit(:sku_id, :asin, :title, :category, :ranking, :brand, :img_url)
    end
end
