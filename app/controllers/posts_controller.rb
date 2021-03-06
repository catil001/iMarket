class PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        respond_to do |f|
            if (@post.save)
                
                f.html {redirect_to "/user/#{current_user.username}", notice: ""}
            else
                f.html { redirect_to "/", notice: "Error: Post not Markted" }
            end
        end
    end
    
    private
    def post_params #allows certain data to be passed via form
        params.require(:post).permit(:user_id, :content, :image)
    end
    
end