class FixesController < ApplicationController

    before_action :admin_user, only: :destroy

    def new
        @fix = Fix.new
    end

    def create
        if current_user
            # Handle Fix.save and save as well user_id
            @fix = current_user.fixes.build(fix_params)
            if @fix.save
                flash[:success] = '"' + @fix.name + '" successfull saved to the database! //  Your contribution: #{current_user.fixes.count}'
                redirect_to new_fix_path
            else
                render 'new'
            end
        else
            @fix = Fix.new(fix_params)
            if @fix.save
                flash[:success] = '"' + @fix.name + '" successfull saved to the database!'
                redirect_to new_fix_path
            else
                render 'new'
            end
        end
    end

    def index
        respond_to do |format|
            format.html { @fixes = Fix.paginate(page: params[:page], :per_page => 30).order("name ASC") }
            format.json do
                @allfixes = Fix.all
                render json: @allfixes, root: false
            end
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
        if @fix.update_attributes( fix_params )
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
        flash[:success] = @fix.name.to_s + " destroyed."
        @fix.destroy
        redirect_to fixes_path
    end

    private

        def admin_user
            @fix = Fix.find_by_id(params[:id])
            redirect_to(root_path) unless current_user.admin?
            redirect_to(fixes_path) if @fix.nil?
        end

        def fix_params
            params.require(:fix).permit(:lat, :lon, :name)
        end

end
