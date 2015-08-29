require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  let!(:test_user) { User.create!(username:'jake', password: '12345')}
  let! (:sample_post) { Post.create!(title: "Cool stuff", body: "Hey now", user_id: test_user.id)}

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
  end

  describe "#new" do
    it "renders a new post form" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    it "creates a new post" do
    post :create, {id: sample_post.id, post:{title: "PINEAPPLE"}}
    expect(response).to redirect_to root_path
    end
  end

  describe "#show" do
    it "shows a post" do
      get :show, id: sample_post.id
      expect(assigns(:post)).to eq(sample_post)
    end

    it "renders show" do
      get :show, id: sample_post.id
      expect(response).to render_template("show")
    end
  end

  describe "#update" do
    it "saves an update" do
      put :update, {id: sample_post.id, post:{title: "COOL YEAH!"}}
      expect(response).to redirect_to post_path(sample_post)
    end

  it "won't save a bad update" do
    old_title = sample_post.title
    put :update, {id: sample_post.id, post:{title: nil}}
    expect(sample_post.reload.title).to eq(old_title)
   end
  end

  describe "#delete" do
    it "deletes the post" do
      delete :destroy, id: sample_post.id
      expect(response).to redirect_to(root_path)
    end

    it "expects count with deleted id to be 0" do
      delete :destroy, id: sample_post.id
      expect(Post.where(id: sample_post.id).count).to eq(0)
    end
  end

end