class WelcomeController < ApplicationController
  def index
    @articulos = Article.all.order('id DESC')
  end
end
