class DriversController < ApplicationController
  



  def index

  	@drivers = Driver.where("day LIKE ? AND month LIKE ?", "%#{params[:search_day]}%", "%#{params[:search_month]}%")
#@drivers= Driver.where(month: info_month).where(day: info_day)
 # @drivers=Driver.all

  end

  def show
  	

  end

  def new

@driver= Driver.new

  end

  def create

  	@driver= Driver.new
     
     @driver.name = params[:driver][:name]
     @driver.delivery= params[:driver][:delivery]
     @driver.payment= @driver.delivery*2.5
     @driver.pay=params[:driver][:pay]
     @driver.day= info_day
     @driver.month=info_month

  	if @driver.save
  		flash[:message]= "New Delivery updated"
  		redirect_to url_for(:controller => :drivers, :action => :index)
           
     else
           render :new
     end

  end

def edit
#@drivers= Driver.where(month: info_month).where(day: info_day)
@driver= Driver.find(params[:id])
end

def update

@driver= Driver.find(params[:id])

  	if @driver.update_attributes(driver_params)
  		#redirect_to @detail
      redirect_to url_for(:controller => :drivers, :action => :index)
  	else
  		render :edit
  end
end






private


def info_day

@day = Time.now.day

	end


	def info_month

		@month = Time.now.month
	end

def driver_params
  params.require(:driver).permit(:name, :delivery,:payment, :pay,:day,:month, :search_day, :search_month)
end

end
