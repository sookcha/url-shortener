class LinksController < ApplicationController
  def index
    render :json => Link.all
  end

  def show
  end

  def create
  end
end
