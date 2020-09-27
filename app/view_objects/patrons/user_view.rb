class Patrons::UserView < ViewObject

  # alias method allows use to rename view_object to a clear name without the initializer
  alias_method :user,      :root_model

  # delegate to model for attributes needed
  delegate  :username, to: :user

end
