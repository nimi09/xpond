class LatestFixesController < ApplicationController


	def index
		respond_to do |format|
			format.html { redirect_to(root_path) }
			format.json do
				@latestfixes = Fix.order('updated_at DESC').limit(params[:count])
				render json: @latestfixes, root: false
			end
		end
	end

	private

end
