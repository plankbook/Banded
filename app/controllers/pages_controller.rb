class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @suggested_users = User.all
    @new_projects = Project.all
  end
end
