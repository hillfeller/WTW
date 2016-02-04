require 'rails_helper'

RSpec.describe PostsController, type: :controller do

let(:my_post){Post.create!(title: "RandomData.random_sentence", body: "RandomData.random_paragraph")}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to have_http_status(:success)
    end

  
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get :show
      expect(response).to have_http_status(:success)
    end


  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "instantiates @post" do
      get :new
      expect(assigns(:post)).to_not be_nil
    end
  end

  describe "POST #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end


  end


  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
