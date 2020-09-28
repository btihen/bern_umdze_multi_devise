class Admins::ApplicationController < ApplicationController
  # before_action :authenticate_admin!, unless: :allowed_access

  private

  def allowed_access
    current_admin
  end

  def this_user
    current_admin
  end
end
