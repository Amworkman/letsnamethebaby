class BabyNamesController < ApplicationController

    def index 
        @baby_names = BabyName.all
    end

    def new 
        @baby_name = BabyName.new
    end

    def create 
        @baby_name = BabyName.new(baby_name_params)

        if baby_name.save 
            redirect_to parents_path
        else
            render :new
            # with errors
        end
    end

    def edit 
        @baby_name = BabyName.find_by_id(params[:id])
    end

    def update 
        @baby_name = BabyName.find_by_id(params[:id])
        ## baby_name_params

        if baby_name.save 
            redirect_to parents_path
        else
            render :new
            # with errors
        end
    end

    private 

    def baby_name_params
    end        

end
