class HelloController < ApplicationController
   def index
       
    end
    def addition
       a=params[:user][:txtnum1]
       b=params[:user][:txtnum2]
       @c=a.to_i + b.to_i
    end
    
end
