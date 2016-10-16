FactoryGirl.define do 
	factory :post do
		title "Post Title"
		author "jpt"
		content "yo ne jpt ho Test Driven Development, or TDD is a concept you will hear a lot, especially in the Ruby on Rails community. Many teams use this methodology to ensure high quality code across the team. Watch the video below to get an overview of how TDD works. "
		factory :invalid_post do
			content "Short content"
		end
	end
	
end