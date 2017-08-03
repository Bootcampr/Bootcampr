class PagesController < ApplicationController
  def index
    @user = User.new
    @events = Event.all
    @upcoming_events = Event.order(date: :asc).limit(5)
    @recent_projects = Project.order(created_at: :desc).limit(5)
  end

  def news
    request = RestClient.get "https://newsapi.org/v1/articles?source=hacker-news&apiKey=#{ENV['NEWS_KEY']}"
    news = JSON.parse(request.body)
    @articles = []
    news['articles'].each do |article|
      @articles << article
    end
    render :news_pages
  end

end
