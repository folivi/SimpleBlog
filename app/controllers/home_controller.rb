class HomeController < ApplicationController
  def index
    @articles = Article.published    
    @hottest_topics = Article.order('created_at desc').published #derniers articles du plus réceent au plus ancien
  end
end
