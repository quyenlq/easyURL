class LinksController < ApplicationController
  before_filter :correct_user, only: :destroy
  def new
  	@link = Link.new
  end

  def create
    #generate random string
    if(params[:link][:name].nil?||params[:link][:name]=="")
      params[:link][:name]=get_url(4)
    end
    #get url information
    doc = Pismo::Document.new(params[:link][:rlink])
    if doc.title.nil?
      flash[:error] = "Sorry! Your URL does not seem right"
      redirect_to root_path
    else
      params[:link][:title]=doc.title
      binding.pry
      params[:link][:desc]=doc.description
      params[:link][:favicon]=doc.favicon
      if(signed_in?)
        @link = current_user.links.build(params[:link])
      else      
  	    @link = Link.new(params[:link])      
      end
  	  if(@link.save)
        flash[:success] = "Created shorten url, please copy and store your URL below"
  		  redirect_to preview_path(@link)
  	  else
        flash[:error] = "Error ocurred while creating new url"
  		  render 'static_pages/home'
      end
    end
  end

  def show
    @link = Link.find(params[:id]);
    @doc = Pismo::Document.new(@link.rlink)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path
  end


  def preview
    @link = Link.find(params[:id]);
  end

  def redirect
    link= Link.find_by_name(params[:name])
    if link.nil?
      redirect_to 'static_pages/notfound'
    else
    redirect_to link.rlink
    end 
  end

  private

  def get_url(length)
    begin
    gen_url=random_string(length)
    end while !Link.find_by_name(gen_url).nil? # avoid generating the same name
    gen_url
  end

  def random_string(length)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    string = ''
    length.times { string << chars[rand(chars.size)] }
    string
  end

  def correct_user
      @link = current_user.links.find_by_id(params[:id])
      redirect_to root_url if @link.nil?
  end
  
end
