class Patrons::EventView < ViewObject

  # alias method allows use to rename view_object to a clear name without the initializer
  alias_method :event,      :root_model
  # alias_method :event_url,  :root_model_url
  # alias_method :event_path, :root_model_path

  # delegate to model for attributes needed
  delegate  :event_name, to: :event

  def event_hosts
    event_reservations.map(&:host).uniq.join(', ')
  end

  def event_description
    event.event_description || ""
  end

  def spaces
    @spaces   ||= Patrons::SpaceView.collection(event.spaces).uniq
  end

end
