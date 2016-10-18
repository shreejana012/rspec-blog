require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe "GET #index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template :index
		end
	end
		describe "GET #show" do
			it "renders the show template" do
				post = FactoryGirl.create(:post)
				get :show, id: post.id
				expect(response).to render_template :show
			end
		end
			describe "GET #new" do
				it "renders the new template" do
				get :new
				expect(response).to render_template :new
			end
			end
			describe "POST #create" do
				it "creates a new post" do
				expect {
				post :create, post: FactoryGirl.attributes_for(:post)
 				}.to change(Post, :count).by(1)

				end
				context "when attributes are valid" do
					it "redirects to root_path" do
						post :create, post: FactoryGirl.attributes_for(:post)
						expect(response).to redirect_to root_path
					end
				end
				context "when attributes are invalid" do
					it "renders the new template" do
						post :create, post: FactoryGirl.attributes_for(:invalid_post)
						expect(response).to render_template :new
					end
				end

				end
				describe "GET #edit" do
					it "edits the post" do
					post = FactoryGirl.create(:post)
				get :edit, id: post.id
				expect(response).to render_template :edit
			end
                end
                describe "PUT #update" do
                     context "when attributes are valid" do
                     	post = FactoryGirl.create(:post)
                     	it "updates the post" do
                     		put :update, id: post.id, post: FactoryGirl.attributes_for(:post, title: 'New title', author: 'shrijana')
                     		post.reload
                     		expect(post.title).to eq("New title")
                     		expect(post.author).to eq("shrijana")
                     	end
                     	it "redirects to root_path" do
                     		put :update, id: post.id, post: FactoryGirl.attributes_for(:post, title: 'New title', author: 'shrijana')
                     		expect(response).to redirect_to root_path
                     	end
                     end
                     context "when attributes are invalid" do
                     	post = FactoryGirl.create(:post)
                     	it "doesn't updates the post" do
                     		put :update, id: post.id, post: FactoryGirl.attributes_for(:post, title: 'New title', author: 'shrijana', content: 'Hello')
                     		post.reload
                     		expect(post.title).to_not eq("New title")
                     		expect(post.author).to_not eq("shrijana")
                     	end
                     it "renders the edit template" do
                     	put :update, id: post.id, post: FactoryGirl.attributes_for(:invalid_post)
                     	expect(response).to render_template :edit
                     end
					end
                 end
                 describe "DELETE #destroy" do 
                 	it "deletes the post" do 
                 		post = FactoryGirl.create(:post)
                 		expect {
                 		delete :destroy, id: post.id }.to change(Post, :count).by(-1) 

                     end
                     it "redirect_to root_path" do
                     	post = FactoryGirl.create(:post)
                     	delete :destroy, id: post.id
                     	expect(response).to redirect_to root_path
                     end
                 end
			end
