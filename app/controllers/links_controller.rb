class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render :json => Link.all
  end

  def show
  end

  def create
    if params[:url] != nil
      find = Link.find_by_url(params[:url])

      if find
        redirect_to find.url
      else
        link = Link.create(
          url: params[:url],
          visit: 0
        )
      end
      
      if link
        render :json => "{'url': ''#{params[:url]}'}'"
      end
    end
  end

  private
  def check_has_url
    
  end
end
