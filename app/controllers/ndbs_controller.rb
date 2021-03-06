class NdbsController < ApplicationController

    before_action :admin_user, only: :destroy

    def new
        @ndb = Ndb.new
    end

    def create
        if current_user
            @ndb = current_user.ndbs.build( ndb_params )
            if @ndb.save
                flash[:success] = '"' + @ndb.identifier + '" successfull saved to the database!'
                redirect_to new_ndb_path
            else
                render 'new'
            end
        else
            @ndb = Ndb.new( ndb_params )
            if @ndb.save
                flash[:success] = '"' + @ndb.identifier + '" successfull saved to the database!'
                redirect_to new_ndb_path
            else
                render 'new'
            end
        end
    end

    def index
        respond_to do |format|
            format.html { @ndbs = Ndb.paginate(page: params[:page], :per_page => 30).order("identifier ASC") }
            format.json do
                @allndbs = Ndb.all
                render json: @allndbs, root: false
            end
        end
    end

    def edit
        @ndb = Ndb.find(params[:id])
    end

    def update
        if current_user
            @ndb = Ndb.find(params[:id])
            @ndb.user_id = current_user.id
            if @ndb.update_attributes( ndb_params )
                flash[:success] = '"' + @ndb.identifier + '" successfull updated.'
                redirect_to ndbs_path
            else
                render 'edit'
            end
        else
            redirect_to login_url, notice: "Please login first."
        end
    end

    def destroy
        flash[:success] = @ndb.identifier + " destroyed."
        @ndb.destroy
        redirect_to ndbs_path
    end

    private

        def admin_user
            @ndb = Ndb.find_by_id(params[:id])
            redirect_to(root_path) unless current_user.admin?
            redirect_to(ndbs_path) if @ndb.nil?
        end

        def ndb_params
            params.require(:ndb).permit(:lat, :lon, :elevation, :frq, :range, :identifier, :name)
        end

end
