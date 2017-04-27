class Post < ActiveRecord::Base
  belongs_to :user
  has_many :images, :as => :imageable, dependent: :destroy
  attr_accessible :title, :body, :id, :user_id
  validates :id, :presence => true
  # before_create :require_user
  scope :published_posts, -> { where('published_at IS NOT NULL') }

  def check_auth
    if session[:user_id] == User.find(session[:user_id])
      flash notice: 'OK'
    else
      flash notice: 'You a not log in system!'
    end
  end
end
