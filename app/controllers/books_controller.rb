class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @book=Book.new
  end
  
  def create
    # viewページ必要ないから変数使わない
    book=Book.new(book_params)
    if book.save
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else
    @books=Book.all
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
    # viewページ必要ないから変数使わない
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
    flash[:notice] = "successfully"
  end
  
  def destroy
    # viewページ必要ないから変数使わない
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    # (book.idなんでいらんかったかは理解できてない)
    # render :index の方がいい？
    flash[:notice] = "successfully"
  end

  
  # プライベートより後に定義されたメソッドは、アクションとして認識されなくなる。つまりURLと対応できなくなる。
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
