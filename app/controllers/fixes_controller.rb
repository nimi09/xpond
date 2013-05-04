class FixesController < ApplicationController
    before_filter :admin_user, only: :destroy

    def new
        @fix = Fix.new
    end

    def create
        if current_user
            # Handle Fix.save and save as well user_id
            @fix = current_user.fixes.build(params[:fix])
            if @fix.save
                flash[:success] = '"' + @fix.name + '" successfull saved to the database! //  Your contribution: #{current_user.fixes.count}'
                redirect_to new_fix_path
            else
                render 'new'
            end
        else
            @fix = Fix.new(params[:fix])
            if @fix.save
                flash[:success] = '"' + @fix.name + '" successfull saved to the database!'
                redirect_to new_fix_path
            else
                render 'new'
            end
        end
    end

    def index
#        @fix = Fix.find(:all)
        @fixes = Fix.order('name ASC').all
#        @users = User.all
        respond_to do |format|
            format.html
            format.json { render json: @fixes, root: false }
        end
    end

    def show
    end

    def edit
        @fix = Fix.find(params[:id])
    end

    def update
        @fix = Fix.find(params[:id])
        @fix.user_id = current_user.id
        if @fix.update_attributes(params[:fix])
#        if current_user.fixes.build(params[:fix], user_id: @fix.id)

#            @fix.user_id = current_user.id
#            @fix.save
            flash[:success] = '"' + @fix.name + '" successfull updated.'
            redirect_to fixes_path
        else
            render 'edit'
        end
    end

    def destroy
        flash[:success] =@fix.name + " destroyed."
        @fix.destroy
        redirect_to fixes_path
    end

    private

        def admin_user
            @fix = Fix.find_by_id(params[:id])
            redirect_to(root_path) unless current_user.admin?
            redirect_to(fixes_path) if @fix.nil?
        end
end
