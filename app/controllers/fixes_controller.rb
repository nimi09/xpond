class FixesController < ApplicationController

    def index
        @fix = Fix.find(:all)
    end

    def new
        @fix = Fix.new
    end

    def create
        @fix = Fix.new(params[:fix])
        if @fix.save
            flash[:success] = "FIX saved to the database"
            redirect_to new_fix_path
        else
            render 'new'
        end
    end
end
