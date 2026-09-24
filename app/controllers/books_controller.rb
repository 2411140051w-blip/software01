class BooksController < ApplicationController
  skip_forgery_protection only: [:create, :destroy, :show, :update]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(title: params[:book][:title], author: params[:book][:author], published_year: params[:book][:published_year])
    book.save
    redirect_to '/' #=>一覧ページにリダイレクトする
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/'
  end

  def show
    @book= Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(title: params[:book][:title], author: params[:book][:author], published_year: params[:book][:published_year])
    redirect_to '/'
  end
end
