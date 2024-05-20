class AddressesController < ApplicationController
  def search
    addresses = Property.where("addr(ess ILIKE ?", "%#{params[:term]}%").select(:address).distinct)
    render json: addresses.map { |address| { label: address.address, value: address.address }}

  end
end
