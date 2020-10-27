class ParentsController < ApplicationController

    def index
        @parents = Parent.all
    end
    
    def show
        @parent = Parent.find_by_id(params[:id])
    end
    
end
