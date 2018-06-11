class PostController < ApplicationController
  def create
  end

  def store
    # upload image to cloudinary
    @image = Cloudinary::Uploader.upload(params[:media])
    # create a new post object and save to db
    @post = Post.new({:title => params[:title], :body => params[:body], :author => params[:author],  :media => @image['secure_url']})
   
    if @post.save
      # broadcasting posts using pusher
      Pusher.trigger('posts-channel','new-post', {
        id: @post.id,
        title: @post.title,
        media: @post.media,
        body: @post.body
      })
    end 
    
    redirect_to('/')
  end
end
