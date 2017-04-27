class User < ActiveRecord::Base
  require 'bcrypt'

  attr_accessible :first_name, :last_name, :username, :password, :email, :birthday, :password_confirmation
  has_many :posts, dependent: :destroy
  has_many :images, :as => :imageable

  attr_accessor :password
  before_save :encrypt_password

  validates :username, :email, :uniqueness => true
  validates :password, :length => { :minimum => 8 }
  validates :username, :email, :presence => true
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  scope :older_than_18, -> { where('birthday < ?', 18.year.ago) }

  def fullname
    "#{first_name} #{last_name}"
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def log_in?
    if session[:user_id] == current_user.id
      system.puts 'Logined user cant do this!'
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end