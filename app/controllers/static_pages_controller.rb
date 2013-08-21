class StaticPagesController < ApplicationController
    def home
        @fix_count = Fix.count
        @ndb_count = Ndb.count
    end

    def download
        @fix = Fix.order('name ASC').all
        @ndb = Ndb.order('identifier ASC').all
    end

    def map
    end
end
