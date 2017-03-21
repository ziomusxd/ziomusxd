class LivesController < ApplicationController

  def index
    @wydanies = Wydanie.order('created_at DESC')
    @accidents = Accident.order('created_at DESC')
  end

end
