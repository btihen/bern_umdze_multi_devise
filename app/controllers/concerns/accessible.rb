module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_admin
      flash.clear
      # The authenticated admin root path can be defined in your routes.rb in: devise_scope :admin do...
      redirect_to(auth_admin_root_path) and return
    elsif current_umdze
      flash.clear
      # The authenticated admin root path can be defined in your routes.rb in: devise_scope :admin do...
      redirect_to(auth_umdze_root_path) and return
    elsif current_patron
      flash.clear
      # The authenticated user root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(auth_patron_root_path) and return
    end
  end
end
