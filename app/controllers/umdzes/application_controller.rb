class Umdzes::ApplicationController < ApplicationController
  before_action :authenticate_umdze!, unless: :allowed_access

  private

  def allowed_access
    current_admin
  end

  def this_user
    current_umdze || current_admin
  end
end
