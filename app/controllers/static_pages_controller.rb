class StaticPagesController < ApplicationController
  def home
  	@link = Link.new
  	if signed_in?
  		@links=current_user.links.paginate(page: params[:page], per_page: 20)
  	end
  end
end
