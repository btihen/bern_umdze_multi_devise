class Umdzes::ReservationsController < Umdzes::ApplicationController

  def edit
    user          = current_umdze || Umdze.first  # TODO: REMOVE
    reservation   = Reservation.find(params[:id])
    space         = Space.find_by(id: reservation.space_id)
    spaces        = Space.all
    event         = Event.find_by(id: reservation.event_id)

    user_view     = Umdzes::UserView.new(user)
    event_view    = Umdzes::EventView.new(event)
    space_view    = Umdzes::SpaceView.new(space)
    spaces_views  = Umdzes::SpaceView.collection(spaces)
    reservation_view = Umdzes::ReservationView.new(reservation)
    # reservation_form = Umdzes::ReservationForm.new_from(reservation)

    render :edit, locals: { user: user_view,
                            event: event_view,
                            space: space_view,
                            spaces: spaces_views,
                            reservation: reservation,
                            reservation_view: reservation_view }
  end

  def update
    user          = current_umdze || Umdze.first # TODO: REMOVE
    reservation   = Reservation.find_by(id: params[:id])
    space         = Space.find_by(id: reservation.space_id)
    spaces        = Space.all
    event         = Event.find_by(id: reservation.event_id)

    user_view     = Umdzes::UserView.new(user)
    event_view    = Umdzes::EventView.new(event)
    space_view    = Umdzes::SpaceView.new(space)
    spaces_views  = Umdzes::SpaceView.collection(spaces)
    reservation_view = Umdzes::ReservationView.new(reservation)

    # udpated_attrs = reservation_params.merge(id: params[:id])
    # reservation   = Umdzes::ReservationForm.new(udpated_attrs)
    reservation.assign_attributes(reservation_params)

    # no submodels involved (hence no form_object)
    if reservation.save
      flash[:notice] = "#{reservation.event.event_name} event was successfully updated."
      redirect_to umdzes_path
    else
      flash[:alert] = 'Please fix the errors'
      render :edit, locals: { user: user_view,
                              event: event_view,
                              space: space_view,
                              spaces: spaces_views,
                              reservation: reservation,
                              reservation_view: reservation_view }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation)
            .permit(:host_name, :space_id, :is_cancelled, :alert_notice,
                    :start_date, :end_date, :start_time, :end_time)
    end
end
