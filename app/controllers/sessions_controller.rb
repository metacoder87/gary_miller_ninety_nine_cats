class SessionsController < ApplicationController
    before_action :require_no_user!, only: %i(create new)

    def new
        render :new
    end

    def create
        
    end

    def destroy
        logout_user!
        redirect_to new_session_url
    end

end