class Feedback < ApplicationRecord
  USER_TYPE = [ 'Client', 'Employee' ]
  CATEGORIES = [ 'Quality', 'Speed', 'Value', 'Creativity', 'Strategy', ]

  validates :user_type, presence: true
  validates :user_type, inclusion: { in: USER_TYPE, message: "can be only client or employee" }
  validates :rating, presence: true
  validates :category, presence: true
  validates :category, inclusion: { in: CATEGORIES, message: "this category is not found" }

  after_create :sendFeedBack

  private
  def sendFeedBack
    FeedbackMailer.feedback_email(self).deliver_now
  end
end
