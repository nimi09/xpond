class UsersController < ApplicationController

    before_action :allready_signed_in, only: [:new]
    before_action :signed_in_user,     only: [:index, :edit, :update, :destroy]
    before_action :correct_user,       only: [:show, :edit, :update]
    before_action :admin_user,         only: [:index, :destroy]

    def index
        @users = User.paginate(page: params[:page], :per_page => 30).order("name")
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new( user_params )
        if @user.save
            flash[:success] = "Sign up succeeded, welcome to XPOND - the crowd sourced Open Nav Data for X Plane!"
            sign_in @user
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes( user_params )
            flash[:success] = "Profile updated"
            sign_in @user
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User destroyed."
        redirect_to users_url
    end

    private

        def allready_signed_in
            if signed_in?
                flash[:notice] = "Please log out before signing up a new user."
                redirect_to root_path
            end
        end
            
        def signed_in_user
            unless signed_in?
                store_location
                redirect_to login_url, notice: "Please log in first."
            end
        end

        def correct_user
            @user = User.find(params[:id])
            redirect_to root_path, notice: "You are not allowed to view this page." unless current_user?(@user)
        end

        def admin_user
            redirect_to(root_path) unless current_user.admin?
        end

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
