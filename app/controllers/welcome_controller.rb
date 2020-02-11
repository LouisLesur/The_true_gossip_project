class WelcomeController < ApplicationController
  def landing_page
    @first_name = params[:first_name]
    @gossips = Gossip.all
  end
end
