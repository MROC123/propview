class PropertiesController < ApplicationController

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    @manager = Manager.new
  end

  def edit
  end

  def update
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if params[:manager_id].present?
      @property.manager = Manager.find(params[:manager_id])
    elsif manager_params.present?
      @property.manager = Manager.create(manager_params)
    end
    if @property.save
      redirect_to @property, notice: "Property has been created successfully"
    else
      render :new
    end
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
