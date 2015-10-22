class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index

    def index
        @blogs = Blog.all.reverse
    end

    def write
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :root
    end

    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    
     def edit
      @blogs = Blog.find(params[:id])
      #@post = Post.find(params[:id])
     end
    
     def update
     blog = Blog.find(params[:id])
     blog.user.email = params[:name]
     blog.content = params[:blog]
     blog.save
     redirect_to :root
     end
 
    def destroy
      blog = Blog.find(params[:id])
      blog.destroy
      redirect_to :root
       #pp = Post.find(params[:id])
       #pp.destroy
       #redirect_to :root
    end
    
    def comment_edit
      @comments = Comment.find(params[:id])
      #@post = Post.find(params[:id])
    end
    
     def comment_update
     comment = Comment.find(params[:id])
     comment.user.email = params[:name]
     comment.msg = params[:comment]
     comment.save
     redirect_to :root
     end
 
    def comment_destroy
      comment = Comment.find(params[:id])
      comment.destroy
      redirect_to :root
       #pp = Post.find(params[:id])
       #pp.destroy
       #redirect_to :root
    end
    
    def page
        @pages = Blog.where(user_id:params[:id])
    end

end