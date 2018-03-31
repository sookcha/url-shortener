class LinksController < ApplicationController
  def index
    render :json => Link.all
  end

  def show
  end

  def create
    render :json => params[:url]
  end

  private
  skip_before_action :verify_authenticity_token
end
