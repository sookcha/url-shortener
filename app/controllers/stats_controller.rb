class StatsController < ApplicationController
  def index
    # Get data in 'year-month-day hour' format using `group by`
    links = Stat.where(link_id: params[:id]).all.group_by{ | record | record.created_at.year.to_s + "-" + record.created_at.month.to_s.rjust(2, '0') + "-" + record.created_at.day.to_s.rjust(2, '0') + " " + record.created_at.hour.to_s.rjust(2, '0') }
    data = { Stats: [] }

    # Iterate through keys on hash
    links.keys.each do |key|
      time_data = {at: key, visits: links[key].count}
      data[:Stats].push(time_data)
    end

    # Show that data if we've got
    if links != nil
      render :json => data
    else
      render :json => "{msg: 'Not Found'}", :status => 404
    end
  end
end
