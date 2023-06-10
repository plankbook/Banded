class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @suggested_users = User.where.not(id: current_user.id).order('random()')
    @new_projects = Project.all.order('random()')
  end
end
