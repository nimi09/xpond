class StaticPagesController < ApplicationController

    before_action :admin_user, only: [:newest_fixes]
    before_action :redirect_unless_admin, only: [:adminmap]

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

    def mapbox
    end

    def map
    end

    def adminmap
        @count = params[:count]
    end

    def newest_fixes
    end

    def totalrows
        st=0; ActiveRecord::Base.send(:subclasses).each {|sc| begin; st += sc.all.size unless sc.all.nil?; rescue ActiveRecord::StatementInvalid; end; };
        @trows = st.to_s;
#        puts "Total number of rows is #{st.to_s}"
    end

    private

        def admin_user
#            @fixes = Fix.order('updated_at DESC').all
            @fixes = Fix.paginate(page: params[:page], :per_page => 30).order("updated_at DESC")

#            @fixes = Fix.paginate(page: params[:page], :per_page => 30)

            redirect_to(root_path) unless current_user.admin?
            redirect_to(root_path) if @fixes.nil?
        end

        def redirect_unless_admin
            redirect_to(root_path) unless current_user.admin?
        end
end
