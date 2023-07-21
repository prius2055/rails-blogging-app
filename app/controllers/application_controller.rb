class ApplicationController < ActionController::Base
    def current_user
        @active_user = User.first
    end
end
