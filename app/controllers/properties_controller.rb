class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    @marker = {lat: "", lng: ""}
    @marker[:lat] = @property.geocode[0]
    @marker[:lng] = @property.geocode[1]
    @manager = @property.manager

  end

  def new
    @property = Property.new
    @manager = Manager.new
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      redirect_to @property, notice: "Property has been created successfully"
    else
      render :new
    end
  end


  def my_properties
    @user_properties = current_user.properties
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
    params.require(:property).permit(:name, :address, :property_type, :bedrooms, :bathrooms, :create_new_manager)
  end
end
