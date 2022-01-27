class DashboardController < ApplicationController
  layout 'admin/admin'
  before_action :authorized

  # dashboard view
  def index
  end

  # user chart
  def userChart
    @userCount = User.group("DATE(created_at)").count
    render template: "dashboard/user-chart"
  end

  # post chart
  def postChart
    @postCount = Post.group("DATE(created_at)").count
    render template: "dashboard/post-chart"
  end
end
