class LinksController < ApplicationController
  def new
  	@link = Link.new
  end

  def create
    #generate random string
    if(params[:link][:name].nil?||params[:link][:name]=="")
      params[:link][:name]=random_string(4)
    end
    #get url information
    doc = Pismo::Document.new(params[:link][:rlink])
    if doc.title.nil?
      flash[:error] = "Sorry! Your URL does not seem right"
      redirect_to root_path
    else
      params[:link][:title]=doc.title
  	  @link = Link.new(params[:link])      
  	  if(@link.save)
        flash[:success] = "Created shorten url, please copy and store your URL below"
  		  redirect_to @link
  	  else
        flash[:error] = "Error ocurred while creating new url"
  		  render 'static_pages/home'
      end
    end
  end

  def show
    @link = Link.find(params[:id]);
    @doc = Pismo::Document.new(@link.rlink)
  end

  def redirect
    link= Link.find_by_name(params[:name])
    if link.nil?
      redirect_to 'static_pages/notfound'
    else
    redirect_to link.rlink
    end 
  end



  def random_string(length)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
    string = ''
    length.times { string << chars[rand(chars.size)] }
    string
  end
end
