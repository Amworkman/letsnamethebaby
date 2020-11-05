class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :team_logged_in?
    helper_method :parent_logged_in?
    helper_method :current_team
    helper_method :current_parent
    helper_method :baby_gender
    helper_method :boy_names
    helper_method :girl_names
    helper_method :all_names

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

    def baby_gender
        if team_logged_in?
            if current_team.babies != []
                current_team.babies.first.gender
            else
                "Baby"
            end
        else
            "Baby"
        end
    end

    def boy_names
        BabyName.all.select do |baby_name|
            baby_name.gender != "Female"
        end
    end

    def girl_names
        BabyName.all.select do |baby_name|
            baby_name.gender != "Male"
        end
    end

    def all_names
        BabyName.all
    end

    # def wrong_page 
    #    render "/wrong_page"
    # end
end
