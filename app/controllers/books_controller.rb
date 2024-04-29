class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @book=Book.new
  end
  
  def create
    book=Book.new(book_params)
    book.save
    redirect_to '/show'
    # リダイレクト先を投稿一覧にする
  end  

  def index
  end

  def show
    
  end

  def edit
  end
  
  # プライベートより後に定義されたメソッドは、アクションとして認識されなくなる。つまりURLと対応できなくなる。
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
