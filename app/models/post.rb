class Post < ActiveRecord::Base
  before_create :check_tweeted_individual
  before_create :send_notification_email

  validates :post, presence: true
  validates :user_id, presence: true

  belongs_to :user

  def check_tweeted_individual
    @called_user = ""
    post_array = self.post.split(" ")
    post_array.each do |segment|
      if segment[0] == "@" && segment.length > 1
        @called_user = segment
      end
    end
    @called_user
  end

  def send_notification_email
    if @called_user != ""
      called_user_email = User.find_by("handle = ?", @called_user)
      UserMailer.called_notification(called_user_email).deliver
    end
  end
end


