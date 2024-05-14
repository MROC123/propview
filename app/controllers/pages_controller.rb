class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @properties = Property.all || []
    @managers = Manager.all || []
  end
end
