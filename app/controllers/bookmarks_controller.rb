class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @bookmark = current_user.bookmarks.new(manager_id: params[:manager_id])
    if @bookmark.save
      redirect_to manager_path(params[:manager_id]), notice: 'Manager was successfully bookmarked.'
    else
      redirect_to manager_path(params[:manager_id]), alert: 'You have already bookmarked this manager.'
    end
  end

  def destroy
    @manager = Manager.find(params[:manager_id])
    @bookmark = current_user.bookmarks.find_by(manager: @manager)
    if @bookmark
      @bookmark.destroy
      redirect_to manager_path(@manager), notice: 'Bookmark was successfully removed.'
    else
      redirect_to manager_path(@manager), alert: 'Bookmark not found.'
    end
  end



  def index
    @bookmarks = current_user.bookmarked_managers
  end
end
