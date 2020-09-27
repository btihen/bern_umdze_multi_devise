class Umdzes::HomeController < Umdzes::ApplicationController

  def index
    spaces        = Space.all
    user          = current_umdze || Umdze.first # TODO: remove
    date          = params[:date].nil? ? Date.today : params[:date].to_s.to_date

    user_view     = Umdzes::UserView.new(user)
    space_views   = Umdzes::SpaceView.collection(spaces)
    calendar_view = Umdzes::CalendarView.new(user_view, date)

    render :index, locals: {user_view: user_view,
                            spaces_view: space_views,
                            calendar_view: calendar_view}
  end

end
