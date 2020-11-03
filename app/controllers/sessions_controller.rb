class SessionsController < ApplicationController

	def new
		@team = Team.new
	end

	def create
    	if params[:provider]
      		@team = Team.from_omniauth(request.env["omniauth.auth"])
			session[:team_id] = @team.id
				if @team.save
					if @team.babies == []
					  	redirect_to edit_team_path(@team)
					else
						redirect_to parents_path(@team)
					end
				else 
					redirect_to sign_up_path 
				end
		elsif params[:commit]["Sign Up"]
			@team = Team.create(team_params)
			if @team && @team.authenticate(params[:password])
        		session[:team_id] = @team.id
        		redirect_to edit_team_path(@team)
      		else
        		redirect_to sign_up_path
      		end
		else
			@team = Team.find_by(teamname: params[:teamname])
      		if @team && @team.authenticate(params[:password])
        		session[:team_id] = @team.id
        		redirect_to parents_path(@team)
      		else
        		redirect_to sign_up_path
      		end
    	end
  	end

  	def destroy
    	session.clear 
    	redirect_to '/'
	end
	  
	private

	def team_params
        params.permit(:teamname, :password)
    end 
end
