class StatsController < ApplicationController
  def index
    link = Stat.find_by(link_id: params[:id])

    if link != nil
      render :json => link
    else
      render :json => "{msg: 'Not Found'}"
    end
  end
end
