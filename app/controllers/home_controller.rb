class HomeController < ApplicationController
  before_filter :check_logged_in
  
  def index
  end



  private
  def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
  end
end




end
