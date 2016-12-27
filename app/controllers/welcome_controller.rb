class WelcomeController < ApplicationController
    def index
    end

    def update
        puts "Received parameters:"
        puts params[:parameter_1]
        puts params[:parameter_2]
        redirect_to :root
    end
end
