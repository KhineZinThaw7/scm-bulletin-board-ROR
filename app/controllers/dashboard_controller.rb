class DashboardController < ApplicationController
  layout 'admin/admin'
  before_action :authorized

  # dashboard view
  def index
  end
end
