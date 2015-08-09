class HomeController < ApplicationController
  def index
  	if user_signed_in? then
  	 	if !Dir.exists?(Rails.root.join(current_user.email)) then
  	 		
  			Dir.mkdir(Rails.root.join(current_user.email))
  			
  		end
  	end
  	
  	@dat=current_user.details.all
  end

  def upload
 uploaded_io = params[:file]

  File.open(Rails.root.join(current_user.email, uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
 det= Detail.new
	  det.email=current_user.email
	  det.filename=uploaded_io.original_filename
	 
	  current_user.details << det
	   redirect_to :controller => "home",:action => 'index'
	 
  end

  def download
@file = params[:pa]
  	 send_file Rails.root.join(current_user.email,  @file),  :x_sendfile=>true
	 
  end

  def post
  end
end
