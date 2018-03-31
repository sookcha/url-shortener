class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render :json => Link.all
  end

  def show
  end

  def create
    render :json => params[:url]
  end

end
