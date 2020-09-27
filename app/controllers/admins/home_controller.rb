class Admins::HomeController < Admins::ApplicationController

  def index
    spaces        = Space.all
    user          = current_admin || Admin.first  # TODO: remove
    date          = params[:date].nil? ? Date.today : params[:date].to_s.to_date

    user_view     = Admins::UserView.new(user)
    space_views   = Admins::SpaceView.collection(spaces)
    calendar_view = Admins::CalendarView.new(user_view, date)

    render :index, locals: {user_view: user_view,
                            spaces_view: space_views,
                            calendar_view: calendar_view}
  end

end
