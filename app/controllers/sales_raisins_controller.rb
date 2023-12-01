class SalesRaisinsController < ApplicationController

  def index
    @sales_raisins = SalesRaisin.all.limit 100
  end

  def search
    @sales = SalesRaisin.where("name LIKE ?","%#{params[:query]}%")
  end
end
