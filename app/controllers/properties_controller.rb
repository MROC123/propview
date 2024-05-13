class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
  end

  def edit
  end

  def update
  end

  def create
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
