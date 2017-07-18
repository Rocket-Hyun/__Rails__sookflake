class IndexController < ApplicationController
    def index
        @projects = Project.last(4)
    end
    
    def check
        if user_signed_in?
            redirect_to "/index/write"
        else
            redirect_to "/users/sign_in"
        end
    end
    
    def read
        @green = Project.all
        unless user_signed_in?
            redirect_to "/users/sign_in"
        end
    end
    
    def mypage
        unless user_signed_in?
            redirect_to "/users/sign_in"
        else
            @my = Project.where(user_id: current_user.id)
            @mymy = Participate.where(user_id: current_user.id)
        end
    end
    
      def write
        unless user_signed_in?
            redirect_to "/users/sign_in"
        end
      end
   
    def write_real
        cup = Project.new
        cup.title = params[:title]
        
        uploader = MachineUploader.new
        uploader.store!(params[:img_url])
        cup.img_url = uploader.url
        
        cup.detail = params[:detail]
        cup.price = params[:price]
        cup.deadline = params[:deadline]
        cup.num_peo = params[:num_peo]
        cup.total_peo = params[:total_peo]
        cup.user_id = params[:idid]
        cup.save
        redirect_to "/index/rewrite/#{cup.id}"
    end

    
    def rewrite
         @project = Project.find(params[:id])
         @comment = Comment.where(project_id:@project)
         @participates = Participate.where(project_id:params[:id])
         @comm = Comment.where(params[:ididid])
        @participaters = []
        Participate.where(project_id:@project.id).each do |pz|
            @participaters << pz.user_id
        end
        
        @percent = (@participaters.size.to_f/@project.num_peo.to_f)*100

    end
 
    def comment
        spoon = Comment.new
        spoon.comments = params[:djdj]
        spoon.project_id = params[:project_id]
        spoon.user_id = params[:ididid]
        spoon.save
        redirect_to "/index/rewrite/#{spoon.project_id}"
    end
    
    def participate
        tea = Participate.new
        tea.project_id = params[:id]
        tea.user_id = current_user.id
        tea.save
        redirect_to "/index/rewrite/#{tea.project_id}"
    end
    
    def delete
        target = Comment.find(params[:id])
        target.delete
        
        redirect_to "/index/rewrite/#{target.project_id}"
    end

    def pink
        dinner = Project.find(params[:id])
        dinner.delete

        Participate.where(project_id:params[:id]).delete_all
     
      redirect_to "/index/mypage"
    end
    
    def exit_pj
        Participate.where(project_id:params[:id]).where(user_id:current_user.id).delete_all
        redirect_to "/index/mypage"
    end
end