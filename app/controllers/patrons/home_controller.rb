class Patrons::HomeController < Patrons::ApplicationController

  def index
    spaces        = Space.all
    user          = current_patron || Patron.first
    date          = params[:date].nil? ? Date.today : params[:date].to_s.to_date

    user_view     = Patrons::UserView.new(user)
    space_views   = Patrons::SpaceView.collection(spaces)
    calendar_view = Patrons::CalendarView.new(user_view, date)

    render :index, locals: {user_view: user_view,
                            spaces_view: space_views,
                            calendar_view: calendar_view}
  end

end
