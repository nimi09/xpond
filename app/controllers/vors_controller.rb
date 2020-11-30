class VorsController < ApplicationController

	before_action :admin_user, only: :destroy

	def new
		@vor = Vor.new
	end

	def create
		if current_user
			@vor = current_user.vors.build( vor_params )
			if @vor.save
				flash[:success] = '"' + @vor.identifier + '" successfull saved to the database!'
				redirect_to new_vor_path
			else
				render 'new'
			end
		else
			@vor = Vor.new( vor_params )
			if @vor.save
				flash[:success] = '"' + @vor.identifier + '" succesfull saved to the database!'
				redirect_to new_vor_path
			else
				render 'new'
			end
		end
	end

	def index
		respond_to do |format|
			format.html { @vors = Vor.paginate(page: params[:page], :per_page => 30).order("identifier ASC") }
			format.json do
				@allvors = Vor.all
				render json: @allvors, root: false
			end
		end
	end

	def edit
		@vor = Vor.find(params[:id])
	end

	def update
		if current_user
			@vor = Vor.find(params[:id])
			@vor.user_id = current_user.id
			if @vor.update_attributes( vor_params )
				flash[:success] = '"' + @vor.identifier + '" successfull updated.'
				redirect_to vors_path
			else
				render 'edit'
			end
		else
			redirect_to login_url, notice: "Please log in first."
		end
	end

	def destroy
		flash[:success] = @vor.identifier + " destroyed."
		@vor.destroy
		redirect_to vors_path
	end

	private

		def admin_user
			@vor = Vor.find_by_id(params[:id])
			redirect_to(root_path) unless current_user.admin?
			redirect_to(vor_path) if @vor.nil?
		end

        def vor_params
            params.require(:vor).permit(:lat, :lon, :elevation, :frq, :range, :slaved, :identifier, :name)
        end

end
