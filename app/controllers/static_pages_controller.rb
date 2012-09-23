class StaticPagesController < ApplicationController
  def home
  	@link = Link.new
  	if signed_in?
  		@links=current_user.links.paginate(page: params[:page], per_page: 10)
  		@boxes=current_user.boxes.paginate(page: params[:page], per_page: 10)
  	end
  end

  def bookmarktool
  	
  end
end
