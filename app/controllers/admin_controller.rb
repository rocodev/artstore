# -*- encoding : utf-8 -*-
class AdminController < ApplicationController

  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required

end
