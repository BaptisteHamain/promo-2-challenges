class User < ActiveRecord::Base
  has_many :posts

  validates :email, uniqueness: true
  validates :email, format: {with: \A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
          message: "is not an email"}
  validates :name, presence: true
end

#Make sure all fields in users aure 'required'
#Make sure email is 'unique' for users
#Make sure email is 'valid' (xxxxx@xxx)