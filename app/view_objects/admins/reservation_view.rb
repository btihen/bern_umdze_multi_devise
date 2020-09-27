class Admins::ReservationView < ViewObject

  # alias method allows use to rename view_object to a clear name without the initializer
  alias_method :reservation,      :root_model

  # delegate to model for attributes needed
  delegate  :start_date_time, :end_date_time, :start_date, :end_date,
            :is_cancelled?, to: :reservation

  # can't use root_model aliases with nested urls, ie:
  # alias_method :reservation_url,  :root_model_url
  # alias_method :reservation_path, :root_model_path
  # so creating paths with url_helpers
  def reservation_path
    url_helpers.space_reservation_path(space_id: space.id, id: id)
  end

  def edit_reservation_path
    url_helpers.edit_space_reservation_path(space_id: space.id, id: id)
  end

  def reservation_url
    url_helpers.space_reservation_url(space_id: space.id, id: id)
  end

  # methods for attribuits
  def alert_notice
    reservation.alert_notice || ""
  end
  alias_method :change_notice, :alert_notice

  def host_name
    @host_name ||= reservation.host_name || ""
  end

  def event_name
    @event_name ||= event.event_name
  end

  def space_name
    @space_name ||= space.space_name
  end

  def event
    @event ||= Admins::EventView.new(reservation.event)
  end

  def space
    @space ||= Admins::SpaceView.new(reservation.space)
  end

  def date_range_string
    @date_range_string ||=
      if is_event_one_day?
        "#{start_date_time.strftime("%Y-%m-%d")} (#{start_date_time.strftime("%H:%M")"} - #{end_date_time.strftime("%H:%M")})"
      else
        "#{start_date_time.strftime("%Y-%m-%d (%H:%M)")} - #{end_date_time.strftime("%Y-%m-%d (%H:%M)")}"
      end
  end

  def date_range
    @date_range ||= (start_date .. end_date)
  end

  def is_event_one_day?
    return true   if start_date == end_date
    false
  end

  def is_multi_day_event?
    return true   if (end_date - start_date).to_i > 0
    false
  end

  def is_range_start?(date)
    return true   if is_multi_day_event? && (date == start_date)
    false
  end

  def is_range_end?(date)
    return true   if is_multi_day_event? && (date == end_date)
    false
  end

end
