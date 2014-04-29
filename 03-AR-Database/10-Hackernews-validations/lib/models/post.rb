class Post < ActiveRecord::Base
  belongs_to :user

  validates :name, uniqueness: true
  validates :rating, numericality: { only_integer: true}
  validates :date, :source_url, :user, presence: true

end

#Make sure all fields in posts aure 'required'
#Make sure thzt name is unique for posts
#(i.e you cannot have two posts with the same name in your app)
#Make sure rating >=0