class TeamsController < ApplicationController

    def new
        @team = Team.new
        2.times { @team.parents.build }
       
    end

    def create 
        @team = Team.new(team_params)
        if @team.save
      
            if params["gender"]["Boy"]
            
                @baby_1 = @team.babies.build(baby_params)
                @baby_2 = @team.babies.build(baby_params)
           
                @team.parents.first.babies << @baby_1
                @team.parents.last.babies << @baby_2
            
                if @team.save
                    redirect_to parents_path 
                else               
                    render :new  
                end      
            elsif params["gender"]["Girl"]
                @baby_1 = @team.babies.build(baby_params)
                @baby_2 = @team.babies.build(baby_params)

                @team.parents.first.babies << @baby_1
                @team.parents.last.babies << @baby_2

                if @team.save
                    redirect_to parents_path 
                else
                    render :new
                end
            elsif params["gender"]["Baby"]
                @baby_1 = @team.babies.build
                @baby_2 = @team.babies.build
                @baby_3 = @team.babies.build
                @baby_4 = @team.babies.build

                @baby_1.gender = "Boy"
                @baby_2.gender = "Girl"
                @baby_3.gender = "Boy"
                @baby_4.gender = "Girl"
                
                @team.parents.first.babies << @baby_1
                @team.parents.first.babies << @baby_2
                @team.parents.last.babies << @baby_3 
                @team.parents.last.babies << @baby_4
                
                if @team.save
                    redirect_to parents_path 
                else
                    render :new
                    # with errors
                end
            else
                render :new
                # with errors
            end
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
        # team_params
        
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
        params.require(:team).permit(:teamname, parents_attributes: [:name, :roll])
    end

    def baby_params
        params.permit(:gender) 
    end
        
end
