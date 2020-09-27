class Admins::UserView < ViewObject

  # alias method allows use to rename view_object to a clear name without the initializer
  alias_method :user,      :root_model

  # delegate to model for attributes needed
  delegate  :id, :admins_name, to: :user

end
