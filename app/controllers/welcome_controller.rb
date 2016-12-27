class WelcomeController < ApplicationController
    def index
    end

    def update
        if params[:parameter_1] != "" and params[:parameter_2] != "" and willDie?
            redirect_to "/good"
        else
            redirect_to "/bad"
        end
        
    end

    def good
    end

    def bad
    end

    def willDie?
        R.eval <<-EOF
        library('nnet')
        set.seed(14)
        pwd = getwd()
        t <- data.frame(#{params[:parameter_1]}, #{params[:parameter_2]},  1, 1, 1, 2, 2, 2, 1, 1, 2) ##{params[:parameter_3]}, #{params[:parameter_4]}, #{params[:parameter_5]}, #{params[:parameter_6]}, #{params[:parameter_7]}, #{params[:parameter_8]}, #{params[:parameter_9]}, #{params[:parameter_10]})
        names(t) <- c("X1", "X2", "X3", "X4", "X5", "X6", "X7", "X8", "X9", "X10")
        pred <- predict(get(load("classifier.RData")), t, type = "class")
        EOF

        R.pred.to_i == 2 ? true : false
    end
end
