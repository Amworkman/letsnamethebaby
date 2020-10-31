class BabyNamesController < ApplicationController

    def index 
        if params[:parent_id]
            set_parent
        end

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
            raise errors.full_message
        end
    end

    def show
        if params[:parent_id]
            set_parent
        end

        if params[:name]
            @baby_name = BabyName.find_by(name: params[:name])
        else
            @baby_name = BabyName.find_by_id(params[:id])
        end

        if !@baby_name
            redirect_to new_parent_baby_name_path(@parent, @baby_name)
        elsif @baby_name.origin == nil || @baby_name.meaning == nil
            redirect_to edit_parent_baby_name_path(@parent, @baby_name)
        end
    end

    def edit
        if params[:parent_id]
            set_parent 
        end 

        @baby_name = BabyName.find_by_id(params[:id])
    end

    def update 

        if params[:parent_id]
            set_parent
        end

        @baby_name = BabyName.find_by_id(params[:id])
        @baby_name.update(baby_name_params)

        if @baby_name.save 
        
            redirect_to parent_path(@parent)
            # Name saved sucsefully,
            # thanks for your contribution
        else
            render :new
            raise errors.full_message
        end
    end

    private 

    def baby_name_params
        params.require(:baby_name).permit(:name, :origin, :meaning, :gender, :variations, :search)
    end  
    
    def set_parent 
        @parent = Parent.find_by_id(params[:parent_id])
    end

end
