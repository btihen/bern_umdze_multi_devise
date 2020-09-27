class Patrons::HomeController < Patrons::ApplicationController

  def index
    user          = current_user

    spaces        = Space.viewable_by(user, tenant)
    space_views   = Patrons::SpaceView.collection(spaces)
    date          = params[:date].nil? ? Date.today : params[:date].to_s.to_date
    calendar_view = Patrons::CalendarView.new(tenant_view, user_view, date)

    respond_to do |format|
      # is tenant really needed?
      format.html { render :index, locals: {spaces_view: space_views,
                                            calendar_view: calendar_view} }
    end
  end

end
