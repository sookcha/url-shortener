class StatsController < ApplicationController
  def index
    links = Stat.where(link_id: params[:id]).all.group_by{ | record | record.created_at.year.to_s + "-" + record.created_at.month.to_s + "-" + record.created_at.day.to_s + " " + record.created_at.hour.to_s }
    data = { Stats: [] }

    links.keys.each do |key|
      time_data = {at: key, visits: links[key].count}
      data[:Stats].push(time_data)
    end

    if links != nil
      render :json => data
    else
      render :json => "{msg: 'Not Found'}"
    end
  end
end
