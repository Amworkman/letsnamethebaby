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
            raise errors.full_message
        end 
    end

    def edit
        if @team.parents.length < 2
            2.times { @team.parents.build }
        end

        if @team.parent_name != nil
            @team.parents.first.name = @team.parent_name
            @team.save
        end
        
    end

    def update 
        
        @team.update(team_params)

        if @team.babies == []
            @baby = @team.babies.build(baby_params)
            @team.parents.each { |parent| @baby.parents << parent }
        end

        if @team.save
            session[:team_id] = @team.id
            redirect_to parents_path
        else
           render :new
           raise errors.full_message
        end
    end

    def show
        @parent_one_babies = @team.parents.first.baby_names
        @parent_two_babies = @team.parents.last.baby_names

        @baby_names = @team.baby_names_arr_dupes(@parent_one_babies, @parent_two_babies)
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
