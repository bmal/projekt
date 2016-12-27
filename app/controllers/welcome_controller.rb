class WelcomeController < ApplicationController
    def index
    end

    def update
        if params[:parameter_1] != "" and params[:parameter_2] != ""
            redirect_to "/good"
        else
            redirect_to "/bad"
        end
        
    end

    def good
    end

    def bad
    end
end
