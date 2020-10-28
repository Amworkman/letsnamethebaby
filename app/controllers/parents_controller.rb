class ParentsController < ApplicationController

    def index 
        @team = Team.find_by_id(params[:team_id])       
        @parents = Parent.where(:team_id => params[:team_id])        
    end
    
    def show
        @parent = Parent.find_by_id(params[:id])
        @team = @parent.team
        @baby_names = BabyName.all

        if @parent.babies.length == 2
            20.times {@baby_name = @parent.baby_names.build}
        elsif @parent.babies.length == 1
            10.times {@baby_name = @parent.baby_names.build}\
        else 
            raise errors.full_messages
        end
    end

    def update 
        @team = @parent.team
        @baby_names = BabyName.all
        @parent = Parent.find_by_id(params[:id]) 
        @parent.parents_baby_names.destroy_all
        @parent.update(parent_params)
        if @parent.save
            render :show
        else
            render :index
            #with errors
        end
    end

    private

    def parent_params
        params.require(:parent).permit( :name, :roll, baby_names_attributes: [:name])
    end
end
