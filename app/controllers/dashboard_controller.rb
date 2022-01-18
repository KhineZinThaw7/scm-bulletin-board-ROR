class DashboardController < ApplicationController
  layout 'admin/admin'
  before_action :authorized

  def index
  end
end
