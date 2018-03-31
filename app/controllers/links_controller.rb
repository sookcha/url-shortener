class LinksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    link = Link.find(params[:id])
    if link != nil
      # Add visit counting
      Stat.create!(
        link_id: link.id
      )

      # If a link does not have http:// or https://, add http to the link.
      unless link.url.include?("http://") || link.url.include?("https://")
        link.url = "http://" + link.url
      end

      # If link found, redirect to that link
      redirect_to "#{link.url}"
    else
      render :json => "{msg: 'Not Found'}", :status => 404
    end
  end

  def create
    link = Link.find_by_url(params[:url])
    # If don't have link, create it
    status = 200

    if link == nil
      link = Link.create!(
        url: params[:url]
      )
      # Status: Created
      status = 201
    end
    
    # If we got a link, show that to user
    if link != nil
      render :json => "{'url': '#{request.base_url.gsub(" ","")}/#{link.id}'}", :status => status
    else
      render :json => "{msg: 'Not Found'}", :status => 404
    end
  end
end
