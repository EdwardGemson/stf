Class ConsultationsController < ApplicationController

def new
  @consultation = Consultation.new
end
#going to need business and artist here
def create
  consultation = Consultation.new(consultation_params)
  if consultation.save
    session[:consultation_id] = consultation.consultation_id
    flash[:notice] = "Your consultation date has been saved"
    redirect_to edit_consultation_path(consultation)
  else
    render :new
    flash[:error] = "There was an error scheduling your consultation, please try again"
  end
end

def edit
end

def update
end

def destroy
end

private
#need to work in business and artist
  # def consultation_params
  #   params.require(consultation).permit(:)
  # end
end