class WzsController < ApplicationController
  before_filter :check_logged_in

  private
  def check_logged_in 
    authenticate_or_request_with_http_basic("Home") do |username, password|
    username == "admin" && password == "admin"
  end
end
end
