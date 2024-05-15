class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    @manager = @property.manager
  end

  def new
    @property = Property.new
    @manager = Manager.new
  end

  def create
    @property = Property.new(property_params)
    # @property.manager = current_user (need to find the Manager ID so property is attached to a manager)
    @property.save
  end



  def edit
  end


  def update
  end


  def destroy
    @property.destroy
    redirect_to properties_url, notice: "Property was destroyed successfully"
  end




  private

  def property_params
    params.require(:review).permit(:name, :address, :type, :bedrooms, :bathrooms)
  end


end
