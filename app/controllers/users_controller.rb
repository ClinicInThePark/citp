class UsersController < ApplicationController
    before_action :signed_in_user,  only: [:edit, :update, :index]
    before_action :correct_user,    only: [:edit, :update]


    def new
    	@user = User.new
    end

    def index
        @users = User.paginate(page: params[:page])
    end

    def show
    	@user = User.find(params[:id])
      @microposts = @user.microposts.paginate(page: params[:page])
    end

    def create 
    	@user = User.new(user_params)
    	if @user.save
        sign_in @user
    		flash[:success] = "Welcome!"
    		redirect_to @user
    	else
    		render 'new'
    	end
    end

    def edit
        @user = User.find(params[:id])
        #if @user.admin == true
       #   flash.now[:success] = "user admin works"
        #end

    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:successful] = "Profile update successful"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end

 #####################################################   
    private

  	  def user_params
  	  	params.require(:user).permit(:name,:email,:password,:password_confirmation)
  	  end

      #Before filters

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end

       def signed_in_user
        unless signed_in?
          store_location
          redirect_to signin_url, notice: "Please sign in."
        end
      end
      
      def admin_user
        redirect_to(root_url) unless currrent_user.admin?
      end 
end 
