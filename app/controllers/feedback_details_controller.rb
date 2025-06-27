class FeedbackDetailsController < ApplicationController
  before_action :authenticate_with_token!
  def new
    @feedback_detail = FeedbackDetail.new
  end

  def create
      @feedback_detail = current_user_session.feedback_details.new(feedback_detail_params)

      puts "-----------+++++"

      if @feedback_detail.save
        puts "------============= innnn"
        redirect_to thank_you_path
      else
        puts "------============= there"
        render :new, status: :unprocessable_entity
      end
    rescue => e
      flash.now[:alert] = "Error: #{e.message}"
      render :new
  end

  def thank_you
  end

  private

  def feedback_detail_params
    params.require(:feedback_detail).permit(:category, :description, :location_address, :urgency, :name, :email, :image)
  end
end
