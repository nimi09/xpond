class StaticPagesController < ApplicationController
    def home
        @fix_count = Fix.count
    end

    def download
        @fix = Fix.order('name ASC').all
    end

    def map
    end
end
