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
        n = 10
        beta_0 = 1
        beta_1 = 0.25
        alpha = 0.05
        seed = 23423
        R.x = (1..n).entries

        R.eval <<-EOF
        set.seed(#{seed})
        y <- #{beta_0} + #{beta_1}*x + rnorm(#{n})
        fit <- lm( y ~ x )
        est <- round(coef(fit),3)
        pvalue <- summary(fit)$coefficients[2,4]
        EOF
    end
end
