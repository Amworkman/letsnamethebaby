class TeamsController < ApplicationController

    def new
        @team = Team.new
        @team.parents.build
        @team.parents.build
    end

    def create 
        @team = Team.new(team_params)
        
        if @team.save
            redirect_to parents_path
        else
           render :new
           # with errors
        end
    end

    def edit
        @team = Team.find_by_id(params[:id])
    end

    def update 
        @team = Team.find_by_id(params[:id])
        ## team_params
        
        if @team.save
            redirect_to parents_path
        else
           render :new
           # with errors
        end
    end

    def show 
        @team = Team.find_by_id(params[:id])
    end

    private 

    def team_params
    end
        
end
