class ManagersController < ApplicationController

  def index
    @managers = Manager.all

  end

  def show
    @manager = Manager.find(params[:id])
    @marker = {lat: "", lng: ""}
    @marker[:lat] = @manager.geocode[0]
    @marker[:lng] = @manager.geocode[1]
    @reviews = @manager.reviews
  end

  def new
    @property = Property.new
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
    params.require(:manager).permit(:name, :address, :photo, :website)
  end
end
