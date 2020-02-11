class GossipController < ApplicationController
  def index
    gossip = Gossip.find.params[:id]
  end
end
