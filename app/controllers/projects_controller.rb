class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @project.user = current_user
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to user_project_path(current_user, @project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
    # @booking = Booking.new
    # @booking.user = current_user
    # @booking.toy = @toy
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to user_project_path(current_user, @project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def index
    @projects = Project.all
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to user_projects_path(current_user), status: :see_other
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end