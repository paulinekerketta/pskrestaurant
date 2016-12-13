class LogsController < ApplicationController

  def index

  @logs=Log.where("day LIKE ? AND month LIKE ?", "%#{params[:search_day]}%", "%#{params[:search_month]}%")

  end

  def new
  @log=Log.new

@report= Driver.where(month: info_month).where(day: info_day)
@payment=@report.sum(:payment)

@sale= Sale.where(month: info_month).where(day: info_day)
@collect_out=@sale.sum(:out_collection)
@collect_in= @sale.sum(:in_collection)
@collection= @sale.sum(:out_collection) + @sale.sum(:in_collection)

@profit= @collection - @payment
  end

  def create
   @log=Log.new

     
     @log.out_collection= params[:log][:out_collection]
    
     @log.in_collection=params[:log][:in_collection]

       @log.total_collection=params[:log][:total_collection]

       @log.total_payout=params[:log][:total_payout]

       @log.profit=params[:log][:profit]

     @log.day= params[:log][:day]
     @log.month=params[:log][:month]

  	if @log.save
  		flash[:message]= "New Profit updated"
  		redirect_to url_for(:controller => :logs, :action => :index)
           
     else
           render :new
     end



  end

  private


  def info_day

@day = Time.now.day

	end


	def info_month

		@month = Time.now.month
	end

def log_params
  params.require(:log).permit(:out_collection,:in_collection,:total_collection,:total_payout,:profit,:day,:month, :search_day, :search_month)
end
end
