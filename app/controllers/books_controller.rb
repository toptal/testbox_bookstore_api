class BooksController < ApplicationController
  def index
    render json: Book.all.map { |b| t = b.title.upcase ; b.update(title: t) ; b }
  end

  def show
    render json: Book.find(params[:id])
  end

  def create
    render json: Book.create!(author: params[:author], title: params[:title])
  end

  def destroy
    res = Book.delete(params[:id])
    render json: {result: res}
  end
end
