class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications
  end
  
  def new
    @select_list = current_user.selectable_providers
    @authentication = Authentication.new
  end
  
  def create
    @authentication = Authentication.new(authentication_params)
    if @authentication.save
      redirect_to edit_user_registration_path
    else
      render 'new'
    end
  end
  
  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to edit_user_registration_path
  end
  
  private
    def authentication_params
      params.require(:authentication).permit(:user_id, :provider, :username )
    end
end
