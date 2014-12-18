class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :togge_approval]
  before_action :set_article, only: [:create]
  before_action :authenticate_user!
  before_action :check_author, only: [:edit, :destroy, :update]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    comment = Comment.new(comment_params)
    comment.tap do |com|
      com.user = current_user
      com.approved = true if current_user == @article.user #on valide automatiquement si le créateur de l'article commente
    end
    @article.comments << comment

    respond_with(@article)
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment.article)
  end
  #approver/desapprouver
  def togge_approval
    @comment.toggle_approval
    redirect_to @comment.article, notice: "Commentaire #{ @comment.approved ? 'approuvé' : 'rejeté'}"
  end

  private
    def set_article
      @article = Article.find(params[:article_id])
    end
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def check_author
      redirect_to @comment.article, notice: 'Only the author can delete comments' unless current_user && current_user.owns_article?(@comment.article)
    end
    def comment_params
      params.require(:comment).permit(:content)
    end
end
