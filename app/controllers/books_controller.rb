class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @book=Book.new
  end
  
  def create
    book=Book.new(book_params)
    if book.save
    redirect_to book_path(book.id)
    # リダイレクト先を投稿一覧にする
    else
    @books=Books.all
    render :index 
    end
  end

  def index
    @books = Book.all 
    @book=Book.new
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
     @book = Book.find(params[:id])  
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  
  # プライベートより後に定義されたメソッドは、アクションとして認識されなくなる。つまりURLと対応できなくなる。
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
