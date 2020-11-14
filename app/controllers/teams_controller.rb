class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :update, :edit]

    def new
        @team = Team.new      
    end

    def create 
        @team = Team.new(team_params)       

        if @team.save
            session[:team_id] = @team.id
            redirect_to parents_path(:team_id => @team.id)
        else               
            render :new 
        end 
    end

    def edit
        if @team.parents.length < 2
            2.times { @team.parents.build }
        end

        if @team.parent_name != nil
            current_team.set_name
        end
        
    end

    def update 
        current_team.reset_and_update_team(team_params, baby_params)
        if current_team.save
            session[:team_id] = @team.id
            redirect_to parents_path
        else
           render :edit
        end
    end

    def show       
        current_team.common_names
    end

    private 

    def team_params
        params.require(:team).permit(:teamname, :password, parents_attributes: [:name, :roll])
    end

    def baby_params
        params.permit(:gender) 
    end

    def set_team
        @team = current_team
    end

        
end
