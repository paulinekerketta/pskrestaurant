class SalesController < ApplicationController
  

  def index
   # @driver= Driver.where(month: info_month).where(day: info_day)
   @sales = Sale.where("day LIKE ? AND month LIKE ?", "%#{params[:search_day]}%", "%#{params[:search_month]}%")

  end

  def show
  end

  def new
@report= Driver.where(month: info_month).where(day: info_day)
@driver=@report.sum(:delivery)
@collection= @driver*9
  	@sale= Sale.new
  end

  def create
	@sale= Sale.new
    #@driver= Driver.where(month: info_month).where(day: info_day)
    #@report=@driver.sum(:delivery)

     @sale.out_sales = params[:sale][:out_sales]
     @sale.out_collection= params[:sale][:out_collection]
     @sale.in_sales= params[:sale][:in_sales]
     @sale.in_collection=params[:sale][:in_collection]
     @sale.day= params[:sale][:day]
     @sale.month=params[:sale][:month]

  	if @sale.save
  		flash[:message]= "New Delivery updated"
  		redirect_to url_for(:controller => :sales, :action => :index)
           
     else
           render :new
     end


  end


  def edit
  end

  def update
  end


  private

  def info_day

@day = Time.now.day

	end


	def info_month

		@month = Time.now.month
	end

def sale_params
  params.require(:sale).permit(:name, :delivery,:outdoor_collection, :in_sales,:day,:month, :search_day, :search_month)
end

end
