class FixesController < ApplicationController

    def index
#        @fix = Fix.find(:all)
        @fix = Fix.order('name ASC').all
        respond_to do |format|
            format.html
            format.json { render json: @fix, root: false }
        end
    end

    def new
        @fix = Fix.new
    end

    def create
        @fix = Fix.new(params[:fix])
        if @fix.save
            flash[:success] = '"' + @fix.name + '" successfull saved to the database!'
            redirect_to new_fix_path
        else
            render 'new'
        end
    end
end
