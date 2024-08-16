class UsersController < ApplicationController

  def show 
   @user = User.find(params[:id])
  # @prototypes = @user.prototype
   #@prototype = Prototype.find(params[:id])
   # @users = @user.includes(:prototype)
  end
end


