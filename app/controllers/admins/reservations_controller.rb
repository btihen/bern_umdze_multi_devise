class Admins::ReservationsController < Admins::ApplicationController

  def new
    user          = current_admin || Admin.first  # TODO: REMOVE
    date          = params[:date].nil? ? Date.today : params[:date].to_s.to_date
    spaces        = Space.all
    events        = Event.all

    user_view     = Admins::UserView.new(user)
    events_views  = Admins::EventView.collection(events)
    spaces_views  = Admins::SpaceView.collection(spaces)

    reservation   = Reservation.new
    reservation_form = Admins::ReservationForm.new_from(reservation)

    render :new, locals: {user: user_view,
                          events: events_views,
                          spaces: spaces_views,
                          reservation: reservation_form}
  end

  def create
    user          = current_admin || Admin.first  # TODO: REMOVE
    spaces        = Space.all
    events        = Event.all

    user_view     = Admins::UserView.new(user)
    events_views  = Admins::EventView.collection(events)
    spaces_views  = Admins::SpaceView.collection(spaces)
    reservation_form = Admins::ReservationForm.new(reservation_params)

    if reservation_form.valid?
      reservation = reservation_form.reservation
      reservation.save!

      flash[:notice] = "#{reservation.event.event_name} event was successfully reserved."
      redirect_to admins_path
    else
      flash[:alert] = 'Please fix the errors'
      render :new, locals: {user: user_view,
                            events: events_views,
                            spaces: spaces_views,
                            reservation: reservation_form}
    end
  end

  def edit
    user          = current_admin || Admin.first  # TODO: REMOVE
    reservation   = Reservation.find(params[:id])
    # event         = Event.find_by(id: reservation.event_id)
    # space         = Space.find_by(id: reservation.space_id)
    spaces        = Space.all
    events        = Event.all

    user_view     = Admins::UserView.new(user)
    # event_view    = Admins::EventView.new(event)
    # space_view    = Admins::SpaceView.new(space)
    events_views  = Admins::EventView.collection(events)
    spaces_views  = Admins::SpaceView.collection(spaces)
    reservation_view = Admins::ReservationView.new(reservation)
    reservation_form = Admins::ReservationForm.new_from(reservation)

    render :edit, locals: { user: user_view,
                            # event: event_view,
                            # space: space_view,
                            events: events_views,
                            spaces: spaces_views,
                            reservation: reservation_form,
                            reservation_view: reservation_view }
  end

  def update
    user          = current_umdze || Umdze.first # TODO: REMOVE
    reservation   = Reservation.find_by(id: params[:id])
    # event         = Event.find_by(id: reservation.event_id)
    # space         = Space.find_by(id: reservation.space_id)
    spaces        = Space.all
    events        = Event.all

    user_view     = Admins::UserView.new(user)
    # event_view    = Admins::EventView.new(event)
    # space_view    = Admins::SpaceView.new(space)
    events_views  = Admins::EventView.collection(events)
    spaces_views  = Admins::SpaceView.collection(spaces)
    reservation_view = Admins::ReservationView.new(reservation)

    udpated_attrs = reservation_params.merge(id: params[:id])
    reservation_form = Admins::ReservationForm.new(udpated_attrs)
    # reservation   = Reservation.find_by(id: params[:id])
    # reservation.assign_attributes(reservation_params)
    # reservation_form = Admins::ReservationForm.new_from(reservation)

    if reservation_form.valid?
      reservation = reservation_form.reservation
      reservation.save!

      flash[:notice] = "#{reservation.event.event_name} event was successfully updated."
      redirect_to umdzes_path
    else
      flash[:alert] = 'Please fix the errors'
      render :edit, locals: { user: user_view,
                              # event: event_view,
                              # space: space_view,
                              events: events_views,
                              spaces: spaces_views,
                              reservation: reservation_form,
                              reservation_view: reservation_view }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation)
            .permit(:host_name, :space_id, :space_name, :space_location,
                    :event_id, :event_name, :event_description,
                    :start_date, :end_date, :start_time, :end_time,
                    :is_cancelled, :alert_notice)
    end
end
