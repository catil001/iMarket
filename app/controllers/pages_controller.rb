# The pages controller contains all the code for any page inside of /pages
class PagesController < ApplicationController
  
  #back end for pages/index
  def index
  end

  #back end for pages/home

  def home
    
    following = Array.new
    for @f in current_user.following do
      following.push(@f.id)
    end
    @posts = Post.where("user_id IN (?)", following) 
     @newPost = Post.new
  end

  #back end for pages/portfolio

  def portfolio
    #grab the username as the URL :id
    if (User.find_by_username(params[:id])) 
      @username = params[:id]
    else 
      #redirect to error message (root for now)
      redirect_to root_path, :notice=> "User not found!"
    end
    
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
  
    @newPost = Post.new
  
    @toFollow = User.all.last(5)
  end

  #back end for pages/notifications not the same as posts
  def collections
    @posts = Post.all
    @newPost = Post.new
    @toFollow = User.all.last(5)
  end
end
