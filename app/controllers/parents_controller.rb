class ParentsController < ApplicationController
    before_action :set_parent, only: [:index, :show, :update]
    def index 
        @team = Team.find_by_id(params[:team_id])       
        @parents = Parent.where(:team_id => params[:team_id])        
    end
    
    def show
        @team = @parent.team
        @baby_names = BabyName.all

        if params[:baby_name_id]
            @baby_name = BabyName.find_by_id(params[:baby_name_id])
            @parent.add_baby_name_to_list(@parent, @baby_name)
        end 

           10.times {@baby_name = @parent.baby_names.build}  
    end

    def update 
            @baby_names = BabyName.all 
            @parent.parents_baby_names.destroy_all
            @parent.update(parent_params)
            @team = @parent.team
        
        if @parent.save
            render :show
        else
            render :index
            raise errors.full_messages
        end
    end

    private

    def parent_params
        params.require(:parent).permit( :name, :roll, baby_names_attributes: [:name])
    end

    def set_parent 
        @parent = Parent.find_by_id(params[:id]) 
    end
end
