class Post < ActiveRecord::Base
  belongs_to :user
  #TODO: add association to the user model

  def to_s
      "#{name} on #{date.strftime('%d/%m/%Y')}, rated #{rating}"
  end
end