class BlogsController < ApplicationController
  
  def index
  end
  
  
  def new
    # この変数は View でも使える
    @blog = Blog.new
  end
  
  
  def create
    
  end
  
end
