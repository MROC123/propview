class ManagersController < ApplicationController

  def index
  end

  def show
    @manager = Manager.find(params[:id])
    @reviews = Manager.reviews && Properties.reviews
  end

  def new
    @manager = Manager.new

  end

  def create
    @manager = Manager.new(manager_params)
    @manager.save
  end

  private

  def manager_params
    params.require(:manager).permit(:name, :address)
  end
end
