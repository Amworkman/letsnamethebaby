class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :team_logged_in?

    def current_team 
        @team ||= Team.find_by_id(session[:team_id])
    end

    def current_parent
        @parent ||= Parent.find_by_id(session[:parent_id])
    end

    def team_logged_in?
        !current_team.nil?
    end

    def parent_logged_in?
        !current_parent.nil?
    end

    # def wrong_page 
    #    render "/wrong_page"
    # end
end
