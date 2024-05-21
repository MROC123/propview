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
    @manager = Manager.new

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
