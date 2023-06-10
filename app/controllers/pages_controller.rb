class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
      @suggested_users = User.where.not(id: current_user.id).order('random()')
    else
      @suggested_users = User.all
    end
    @new_projects = Project.all.order('random()')
  end
end
