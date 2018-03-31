class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    link = Link.find(params[:id])
    # Add visit counting
    Stat.create(
      link_id: link.id
    )

    # If link found, redirect to that link
    if link != nil
      redirect_to "http://#{link.url}"
    end
  end

  def create
    link = Link.find_by_url(params[:url])

    # If don't have link, create it
    if link == nil
      link = Link.create(
        url: params[:url],
        visit: 0
      )
    end
    
    # If we got a link, show that to user
    if link
      render :json => "{'url': '#{request.base_url.gsub(" ","")}/#{link.id}'}"
    end
  end
end
