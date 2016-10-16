class Post < ActiveRecord::Base
validates :content,length: { maximum: 50 }, presence: true
validates :title, :author, presence: true

end
