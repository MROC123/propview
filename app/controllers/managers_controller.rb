class ManagersController < ApplicationController

  def index
    @managers = Manager.all

  end

  def show
    @manager = Manager.find(params[:id])
    @reviews = @manager.reviews
    # && @Properties.reviews (delete this code)
    # raise
  end

  def new
    @property.new
    @manager = Manager.new
    @managers = Manager.all
  end

  def create
    @manager = Manager.new(manager_params)
    @manager.user = current_user
    @manager.save
    redirect_to manager_path(@manager)
  end

  private

  def manager_params
    params.require(:manager).permit(:name, :address)
  end
end
