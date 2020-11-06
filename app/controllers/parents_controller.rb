class ParentsController < ApplicationController
    before_action :set_team, only: [:index, :show, :update]
    before_action :set_parent, only: [:show, :update]
    
    def index    
        @parents = current_team.parents        
    end
    
    def show
        session[:parent_id] = @parent.id
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
        
        if @parent.save
            render :show
        else
            render :index
        end
    end

    private

    def parent_params
        params.require(:parent).permit( :name, :roll, baby_names_attributes: [:name])
    end

    def set_parent 
        @parent = Parent.find_by_id(params[:id]) 
    end

    def set_team
        @team = current_team
    end
end
