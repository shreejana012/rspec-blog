FactoryGirl.define do 
	factory :post do
		title "Post Title"
		author "jpt"
		content "yo ne jpt ho"
		factory :invalid_post do
			content "Short content"
		end
	end
	
end