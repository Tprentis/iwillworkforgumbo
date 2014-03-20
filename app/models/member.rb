require 'digest'
class Member < ActiveRecord::Base

  attr_accessor :password

  validates :email, :uniqueness => true,
            :length => {:within => 5..50},
            :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validates :password, :confirmation => true,
            :length => { :within => 4..20 },
            :presence => true,
            :if => :password_required?

  has_one :profile
  has_many :jobs, :order => 'published_at DESC, title ASC', :dependent => :nullify
  has_many :replies, :through => :jobs, :source => :bids
  has_many :comments, as: :commentable

  before_create { generate_token(:auth_token) }
  before_save :encrypt_new_password

  def self.authenticate(email, password)
    member = find_by_email(email)
    return member if member && member.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end



  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Member.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    MemberMailer.password_reset(self).deliver
  end

  protected

    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end

    def password_required?
      hashed_password.blank? || password.present?
    end

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end


end
