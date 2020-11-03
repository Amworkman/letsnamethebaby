class CallbacksController < ApplicationController

    def google
        @team = Team.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

end