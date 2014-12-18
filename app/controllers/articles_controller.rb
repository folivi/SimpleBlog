class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :create]
  before_action :check_owner, only: [:edit] #seul l'auteur peut modifier l'article

  respond_to :all

  def index
    @articles = Article.all.includes(:tags)
      if request.get?
      unless params[:article].nil?
        puts params[:article][:tag_ids] = params[:article][:tag_ids].delete_if {|param| param.empty?}# .any?(&:empty?)
        @articles = @articles.where("lower(title) like ?", "%#{params[:article][:title].downcase}%") unless params[:article][:title].blank?
        @articles = @articles.where("lower(content) like ?", "%#{params[:article][:content].downcase}%") unless params[:article][:content].blank?
        @articles = @articles.where('tags.id' => params[:article][:tag_ids].to_a ) unless params[:article][:tag_ids].nil?
      end
    end    
    respond_with(@articles)
  end

  def show
    @latest_articles = Article.latest
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    current_user.articles << @article    
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :image, :draft, tag_ids: [])
    end
    def check_owner
      redirect_to @article, notice: 'only owner can update' unless current_user && current_user.owns_article?(@article)
    end
end
