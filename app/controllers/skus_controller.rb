class SkusController < ApplicationController
  before_action :set_sku, only: [:show, :edit, :update, :destroy]

  # GET /skus
  # GET /skus.json
  def index
	@skus= Sku.all.includes(:asin)
	
  end

  # GET /skus/1
  # GET /skus/1.json
  def show
  
    @end_at = Date.today
    @start_at = @end_at - 6
    @categories = @start_at.upto(@end_at).to_a

  	#Sales Historyグラフ
    @sales_data = [500, 600, 300, 100, 200, 400, 700,500, 600, 300, 100, 200, 400, 700,100, 200, 400, 700,500, 600, 600, 300, 100, 200,]
    @sales_history = LazyHighCharts::HighChart.new("graph") do |f|
      f.title(:text => "Sales History", :align =>"left")
      f.chart(:type => "column")
      f.xAxis(:categories => @categories)
      f.series(:name => "Sales", :data => @sales_data)
	  end

#Order Historyのグラフ
    @order_data = [80, 60, 30, 10, 40, 50, 90,60, 30, 10, 40, 50, 90,50, 90,60, 30, 10, 40, 50,]
    @order_history = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Order History',:align =>"left")
      f.xAxis(:categories => @categories)
      f.series(name: 'Order', :data => @order_data)
    end

#Price Historyのグラフ
    @price_data = [80, 60, 30, 10, 40, 50, 90,60, 30, 10, 40, 50, 90,50, 90,60, 30, 10, 40, 50,]
    @price_history = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: 'Order History',:align =>"left")
      f.xAxis(:categories => @categories)
      f.series(name: 'Order', :data => @price_data)
    end
  
  
  end

  # GET /skus/new
  def new
    @sku = Sku.new
  end

  # GET /skus/1/edit
  def edit
  end

  # POST /skus
  # POST /skus.json
  def create
    @sku = Sku.new(sku_params)

    respond_to do |format|
      if @sku.save
        format.html { redirect_to @sku, notice: 'Sku was successfully created.' }
        format.json { render :show, status: :created, location: @sku }
      else
        format.html { render :new }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skus/1
  # PATCH/PUT /skus/1.json
  def update
    respond_to do |format|
      if @sku.update(sku_params)
        format.html { redirect_to @sku, notice: 'Sku was successfully updated.' }
        format.json { render :show, status: :ok, location: @sku }
      else
        format.html { render :edit }
        format.json { render json: @sku.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skus/1
  # DELETE /skus/1.json
  def destroy
    @sku.destroy
    respond_to do |format|
      format.html { redirect_to skus_url, notice: 'Sku was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sku
      @sku = Sku.find(params[:id])
      @asin = Asin.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sku_params
      params.require(:sku).permit(:user_id, :sku, :my_price, :ceiling_price, :floor_price, :supplier, :cost, :repricing_status, :fba_status)
    end
end
