class AddressChannel < ApplicationCable::Channel
  def subscribed
    stream_from "address_channel"
  end

  def unsubscribed
  end

  def search(data)
    term = data['term']
    addresses = Address.where('address ILIKE ?', "%#{term}%").limit(10)
    ActionCable.server.broadcast "address_channel", addresses: addresses.map { |address| { label: address.full_address, value: address.full_address } }
  end
end
