class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_required
    if current_user.admin? == false
      render :text => "You can't access this page"
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.admin? == true
      admin_products_path
    else
      products_path
    end

  end

  def after_sign_out_path_for(resource_or_scope)
    products_path
  end
end
