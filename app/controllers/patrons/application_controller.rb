class Patrons::ApplicationController < ApplicationController
  before_action :authenticate_patron!, unless: :allowed_access

  private

  def allowed_access
    current_umdze || current_admin
  end

  def this_user
    current_patron || current_umdze || current_admin
  end
end
