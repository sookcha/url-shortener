class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render :json => Link.all
  end

  def show
    link = Link.find(params[:id])
    if link != nil
      redirect_to "http://#{link.url}"
    end
  end

  def create
    link = Link.find_by_url(params[:url])

    if link == nil
      link = Link.create(
        url: params[:url],
        visit: 0
      )
    end
    
    if link
      render :json => "{'url': '#{params[:url]}'}"
    end
  end
end
