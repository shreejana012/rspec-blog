class Post < ActiveRecord::Base
validates :content,length: { minimum: 50 }, presence: true
validates :title, :author, presence: true

end
