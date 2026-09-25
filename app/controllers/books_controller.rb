class BooksController < ApplicationController
  skip_forgery_protection only: [:create, :destroy, :show, :update]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(title: params[:book][:title], author: params[:book][:author], published_year: params[:book][:published_year])
    if @book.save
      flash[:notice] = '１レコード追加しました'
      redirect_to '/' #=>一覧ページにリダイレクトする
    else
      render 'new', status: :unprocessable_content
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = '１レコード削除しました'
      redirect_to '/'
    else
      flash[:notice] = '削除に失敗しました'
    end
  end

  def show
    @book= Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(title: params[:book][:title], author: params[:book][:author], published_year: params[:book][:published_year])
      flash[:notice] = '１レコード編集しました'
      redirect_to '/'
    else
      flash[:notice] = '編集に失敗しました'
      render 'edit', status: :unprocessable_content
    end
  end

end
