require 'rails_helper'
class User
  def owns_article?(article)
    true
  end
end

RSpec.describe ArticlesController, :type => :controller do
  login_user

  # let(:user){ {name: 'test user', email: 'test@user.com', encrypted_password: '$2a$10$5qlOIpmoRezPsjztlysun.2q23yEJyzFLs1iry.ZOUVtAe4UDQU2i'} }
  # before { controller.stub(:current_user) { user }}

  let(:valid_attributes) {
    {title: 'this is not a test', content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione assumenda vitae officia obcaecati, qui cumque, vel? Nihil quidem vitae eos. Nemo, id perspiciatis odit officiis, quae harum nulla pariatur qui.', image: 'http://placehold.it/900x300', draft: true}
  }

  let(:invalid_attributes) {
    {title: 'this is not a test again', content: nil, image: 'http://placehold.it/900x300'}
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all articles as @articles" do
      article = Article.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe "GET show" do
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :show, {:id => article.to_param}, valid_session
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "GET new" do
    it "assigns a new article as @article" do
      get :new, {}, valid_session
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "GET edit" do
    it "assigns the requested article as @article" do
      article = Article.create! valid_attributes
      get :edit, {:id => article.to_param}, valid_session
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Article" do
        expect {
          post :create, {:article => valid_attributes}, valid_session
        }.to change(Article, :count).by(1)
      end

      it "assigns a newly created article as @article" do
        post :create, {:article => valid_attributes}, valid_session
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it "redirects to the created article" do
        post :create, {:article => valid_attributes}, valid_session
        expect(response).to redirect_to(Article.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        post :create, {:article => invalid_attributes}, valid_session
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "re-renders the 'new' template" do
        post :create, {:article => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title: 'new title', content: 'blllllaaaaa', image: 'http://placehold.it/900x300'}
      }

      it "updates the requested article" do
        article = Article.create! valid_attributes
        put :update, {:id => article.to_param, :article => new_attributes}, valid_session
        article.reload
        article.title.should eq('new title')
      end

      it "assigns the requested article as @article" do
        article = Article.create! valid_attributes
        put :update, {:id => article.to_param, :article => valid_attributes}, valid_session
        expect(assigns(:article)).to eq(article)
      end

      it "redirects to the article" do
        article = Article.create! valid_attributes
        put :update, {:id => article.to_param, :article => valid_attributes}, valid_session
        expect(response).to redirect_to(article)
      end
    end

    describe "with invalid params" do
      it "assigns the article as @article" do
        article = Article.create! valid_attributes
        put :update, {:id => article.to_param, :article => invalid_attributes}, valid_session
        expect(assigns(:article)).to eq(article)
      end

      it "re-renders the 'edit' template" do
        article = Article.create! valid_attributes
        put :update, {:id => article.to_param, :article => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect {
        delete :destroy, {:id => article.to_param}, valid_session
      }.to change(Article, :count).by(-1)
    end

    it "redirects to the articles list" do
      article = Article.create! valid_attributes
      delete :destroy, {:id => article.to_param}, valid_session
      expect(response).to redirect_to(articles_url)
    end
  end

end
