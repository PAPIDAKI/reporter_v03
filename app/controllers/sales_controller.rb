class SalesController < ApplicationController
  def index
    #@sales = Sale.all.limit 100 
    #@sales = Sale.search(params[:search])
    @recent_sales = Sale.order(date: :desc).limit(50)
    
    @sales = if params[:query].present?
               Sale.where("name LIKE ? AND quant > 100", "%#{params[:query].strip}%")
              else
               @recent_sales # Sale.order(date: :desc).limit(50)
              end
  end

end
