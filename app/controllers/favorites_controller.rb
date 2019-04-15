class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:id])
    if @user.favorites.create(location_name: params[:location])
      flash[:notice] = "You have added #{@user.favorites.last.location_name} to your favorites!"
    end
    redirect_to root_path
  end
end
