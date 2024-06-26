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
    @managers = Manager.all
    @manager = Manager.new
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      redirect_to @property, notice: "Property has been created successfully"
    else
      @managers = Manager.all
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
    params.require(:property).permit(:manager_id, :name, :address, :property_type, :bedrooms, :bathrooms, photos: [])
  end
end
