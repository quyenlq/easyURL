class BoxesController < ApplicationController
	before_filter :correct_user ,only: [:show, :destroy, :edit, :update]
	before_filter :signed_in_user

	def new
		@box=Box.new
		respond_to do |format|
			format.js
			format.html
		end
	end

	def show
		@box=Box.find(params[:id])
		@links=@box.links.paginate(page: params[:page], per_page: 10)
	end

	def create
		@box=current_user.boxes.build(params[:box])
		if @box.save
			flash[:success] = "Create new box succesfully"
			redirect_to root_path
		else
			flash.now[:error] = "Error orrcured"
			render 'new'
		end
	end

	def destroy
    	@box.destroy
    	redirect_to root_path
  	end

  	def edit
  		@box=current_user.boxes.find(params[:id])
  		respond_to do |format|
  			format.js
  		end
  	end

  	def update
  		@box=current_user.boxes.find(params[:id])
  		if @box.update_attributes(params[:box])
  			flash[:success] = "Box name changed"
  			redirect_to @box
  		else 
  			flash[:error] = "Some error occured, please try again"
  			redirect_to @box
  		end
  	end


private
	def correct_user
      @box = current_user.boxes.find_by_id(params[:id])
      redirect_to root_url if @box.nil?
  	end

  	def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
  	end
end
