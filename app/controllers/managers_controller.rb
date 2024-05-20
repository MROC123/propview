class ManagersController < ApplicationController

  def index
    @managers = Manager.all

  end

  def show
    @manager = Manager.find(params[:id])
    @reviews = @manager.reviews
    # && @Properties.reviews (delete this code)
  end

  def new
    @manager = Manager.new
  end

  def search
    @managers = Manager.where("name ILIKE ?", "%#{params[:term]}%")
    render json: @managers.map { |manager| { id: manager.id, name: manager.name } }
  end

  def create
    @manager = Manager.new(manager_params)
    @manager.user = current_user
    if @manager.save
      redirect_to new_property_path(manager_id: @manager.id), notice: "Manager created successfully"
    else
      render :new
    end
  end

  private

  def manager_params
    params.require(:manager).permit(:name, :address)
  end
end
