class BabyNamesController < ApplicationController
    before_action :set_parent, only: [:index, :show, :edit, :update]
    before_action :set_baby_name, only: [:edit, :update]
    def index
        @baby_names = BabyName.all
    end

    def new 
        @baby_name = BabyName.new
    end

    def create 
        @baby_name = BabyName.new(baby_name_params)

        if @baby_name.save 
            redirect_to baby_name_path(@baby_name)
        else
            render :new
        end
    end

    def show
        if params[:name]
            @baby_name = BabyName.find_by(name: params[:name])
        else
            @baby_name = BabyName.find_by_id(params[:id])
        end

        if !@baby_name
            redirect_to new_parent_baby_name_path(@parent, @baby_name)
        elsif @baby_name.origin == nil || @baby_name.meaning == nil || @baby_name.gender == nil
            redirect_to edit_parent_baby_name_path(@parent, @baby_name)
        end
    end

    def edit
    end

    def update        
        @baby_name.update(baby_name_params)

        if @baby_name.save 
        
            redirect_to parent_path(@parent)
            # Name saved sucsefully,
            # thanks for your contribution
        else
            render :new
        end
    end

    private 

    def baby_name_params
        params.require(:baby_name).permit(:name, :origin, :meaning, :gender, :variations, :search)
    end  
    
    def set_parent 
        if session[:parent_id]
            @parent = current_parent
        end
    end

    def set_baby_name
        @baby_name = BabyName.find_by_id(params[:id])
    end

end
