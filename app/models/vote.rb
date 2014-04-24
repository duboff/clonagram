class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  enum direction: [:up, :down]

  after_create :send_email

  def send_email
    VoteMailer.notification(self, post).deliver
  end
end
