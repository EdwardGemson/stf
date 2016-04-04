Class BusinessesController < ApplicationController

def new
  @business = Business.new
end

def create
  business = Business.new(business_params)
  if business.save
    session[:business_id] = business.id
    flash[:notice] = "Thanks for registering"
    redirect_to edit_business_path(business)
  else
    render :new
    flash[:error] = "There was an error with your registration, please try again"
  end
end

def edit
end

def update
end

def destroy
end

private
def business_params
  params.require(business).permit(:name, :password, :password_confirmation)
end
end