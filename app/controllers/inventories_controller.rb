class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]

  # GET /inventories
  # GET /inventories.json
def index
    @q = Inventory.ransack(params[:q])
	@inventories = @q.result(distinct: true)
end

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

=begin
	  @member_chart = LazyHighCharts::HighChart.new('column') do |f|
		  f.title(:text => "Population vs GDP For 5 Big Countries [2009]")
		  f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
		  f.series(:name => "GDP in Billions", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
		  f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81, 65])
		  f.yAxis [{:title => {:text => "GDP in Billions"} },{:title => {:text => "Population in Millions"}, :opposite => true},]
		  f.chart({:defaultSeriesType=>"column"})
		end
=end

 end



  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:sku, :asin, :upc, :title, :condition, :price, :ceiling, :competitor, :bb, :lowest, :fbalowest, :stock, :has_amazon, :alert, :category, :ranking, :fba, :image)
    end
end
