class StatsController < ApplicationController
  def index
    link = Stat.where(link_id: params[:id]).all

    if link != nil
      render :json => link
    else
      render :json => "{msg: 'Not Found'}"
    end
  end
end
