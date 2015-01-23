class StaticPagesController < ApplicationController

    before_filter :admin_user, only: [:newest_fixes]

    def home
        @fix_count = Fix.count
        @vor_count = Vor.count
        @ndb_count = Ndb.count
    end

    def download
        @fix = Fix.order('name ASC').all
        @vor = Vor.order('identifier ASC').all
        @ndb = Ndb.order('identifier ASC').all
    end

    def map
    end

    def newest_fixes
    end

    private

        def admin_user
#            @fixes = Fix.order('updated_at DESC').all
            @fixes = Fix.paginate(page: params[:page], :per_page => 30).order("updated_at DESC")

#            @fixes = Fix.paginate(page: params[:page], :per_page => 30)

            redirect_to(root_path) unless current_user.admin?
            redirect_to(root_path) if @fixes.nil?
        end
end
