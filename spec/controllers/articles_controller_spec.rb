require 'rails_helper'

describe ArticlesController do
  let(:article) { FactoryGirl.create :article}
  let(:attributes) { FactoryGirl.attributes_for :article}
  describe "GET #index" do
    before(:each) do
      get :index
    end
    it "responds with a 200" do
      expect(response.status).to eq(200)
    end
    it "assigns the articles instance variable" do
      expect(assigns(:articles)).to be_a(ActiveRecord::Relation)
    end
    it "assigns the articles instance variable" do
      expect(assigns(:article)).to be_a(Article)
    end
  end

  describe 'POST #create' do
    it "saves a new article in the database" do
      expect{
      post :create, :article => attributes}.to change{ Article.count}.by(1)
    end
  end

end