class BooksController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @book=Book.new
  end
  
  def create
    # バリデーションを使わないときはviewページ必要ないからインスタンス変数使わない
    @book=Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
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
     # [バリデーションを使わないとき]はviewページ必要ないからインスタンス変数使わない
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    # redirect_to book_path(book.id)も使う  
    end
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
