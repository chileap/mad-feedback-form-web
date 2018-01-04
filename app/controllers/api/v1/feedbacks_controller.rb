module Api::V1
  class FeedbacksController < ActionController::API
    def create
      @feedback = Feedback.new(feedback_params)
      if @feedback.save
        render json: @feedback, status: :created
      else
        render json: @feedback, status: :unprocessable_entity
      end
    end

    private

    def feedback_params
      params.require(:feedback).permit(:user_type, :category, :comments, :rating)
    end
  end

end
