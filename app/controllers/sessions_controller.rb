class SessionsController < ApplicationController
    before_action :allready_signed_in, only: [:new]

    def new
    end

    def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            #sign in user and redirect to users show page
            sign_in user
            redirect_back_or user
        else
            flash.now[:error] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end

    private

        def allready_signed_in
            if signed_in?
                flash[:notice] = 'Please log out before siging in a new user.'
                redirect_to root_path
            end
        end
end
