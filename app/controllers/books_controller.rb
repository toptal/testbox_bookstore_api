class BooksController < ApplicationController
  def index
    puts "======= WE'RE ON A BRANCH, SIR"
    render json: Book.all
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
