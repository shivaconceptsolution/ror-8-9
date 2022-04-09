class RegistrationController < ApplicationController
	def login
    
      if params[:commit] == "Login"
    	 uid = params[:username]
    	 pwd = params[:password]
         @s = Reg.where("username= ? AND password= ?",uid,pwd).take
         if @s!=nil
         	redirect_to courses_path
         else
            redirect_to '/registration/login?q=login fail' 	
         end
       end 
    end    
    
   def register
     @reg = Reg.new
    end
    def registerlogic
    
    	
     @reg = Reg.new(reg_params)
     if @reg.save
       redirect_to '/registration/login'
     else
      render :new, status: :unprocessable_entity
     end
    end
  
  private
    def reg_params
      params.require(:reg).permit(:username, :password, :fname)
    end
end
