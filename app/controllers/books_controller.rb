class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @book=Book.new
  end
  
  def create
    book=Book.new(book_params)
    if book.save
    redirect_to book_path(book)
    # リダイレクト先を投稿一覧にする
    else
    @books=Books.all
    render :index 
    end
  end

  def index
    @books = Book.all  
  end

  def show
    @book = Book.find(params[:id])  
  end

  def edit
  end
  
  # プライベートより後に定義されたメソッドは、アクションとして認識されなくなる。つまりURLと対応できなくなる。
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
