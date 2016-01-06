class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Scopes #
  scope :excluding_archived, lambda { where(archived_at: nil) }

  # Custom methods #
  def archive
    self.update(archived_at: Time.now)
  end

  # Override methods #
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end


end
