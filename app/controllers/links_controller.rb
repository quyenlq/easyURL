class LinksController < ApplicationController
  def new
  	@link = Link.new
  end

  def create
  	@link = Link.new(params[:link])
    @link.update_attributes(name: "asdf",title: "Test")
  	if(@link.save)
      flash[:success]
  		redirect_to @link
  	else
  		render root_path
    end
  end

  def show
    @link = Link.find(params[:id]);
  end
end
