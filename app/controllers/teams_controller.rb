class TeamsController < ApplicationController

    def new
        @team = Team.new
        2.times { @team.parents.build }
       
    end

    def create 
        @team = Team.new(team_params)       
            
        @baby = @team.babies.build(baby_params)
           @team.parents.each { |parent| @baby.parents << parent }            
        if @team.save
            redirect_to parents_path(:team_id => @team.id)
        else               
            render :new 
            raise errors.full_message
        end 
    end

    def edit
        @team = Team.find_by_id(params[:id])
    end

    def update 
        @team = Team.find_by_id(params[:id])
        @team.update(team_params)
        @baby = @team.babies.first
        @baby.update(baby_params)

        if @team.save
            redirect_to parents_path
        else
           render :new
           raise errors.full_message
        end
    end

    def show 
        @team = Team.find_by_id(params[:id])

        @parent_one_babies = @team.parents.first.baby_names
        @parent_two_babies = @team.parents.last.baby_names

        @baby_names = @team.baby_names_arr_dupes(@parent_one_babies, @parent_two_babies)
    end

    private 

    def team_params
        params.require(:team).permit(:teamname, parents_attributes: [:name, :roll])
    end

    def baby_params
        params.permit(:gender) 
    end
        
end
