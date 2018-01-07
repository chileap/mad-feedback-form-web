class FeedbackMailer < ActionMailer::Base
  default from: ENV['SENDER_EMAIL']

  def feedback_email(feedback)
    @feedback = feedback
    mail(to: ENV['RECEIVER_EMAIL'].split(','), subject: "Feedback from #{@feedback.user_type}")
  end
end
