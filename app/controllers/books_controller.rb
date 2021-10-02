class BooksController < ApplicationController
  #indexへBookのテーブル全てと、新規追加用のbookの空のインスタンス変数を追加
  def index
    @books = Book.all
    @book = Book.new
  end

  #showへBookを表示する為に対応するidのbookを格納
  def show
    @book = Book.find(params[:id])
  end
  #不要
  def new
  end

  #編集するBookを表示する為に対応するidのbookを格納
  def edit
    @book = Book.find(params[:id])
  end

  #新規追加用のコントローラー
  def create
    #データを新規登録するためにインスタンス変数を作成
    @book = Book.new(book_params)
    #得た@bookの内容をDBに保存
    if @book.save
      #フラッシュメッセージに保存成功のメッセージを追加
      flash[:notice] = "create content successfully"
      #bookのidを末尾としたページへリダイレクト
      redirect_to book_path(@book.id)
    else
      #バリデーションの結果失敗した場合改めてBook.allの値を格納したインスタンス変数を用意し、indexへrenderを用いてリダイレクト
      @books = Book.all
      render :index
    end
  end

  #削除を作成
  def destroy
    #bookに対応idのローカル変数を格納
    book = Book.find(params[:id])
    #削除し、成功した場合その旨のフラッシュメッセージを追加
    book.destroy
    flash[:notice] = "data delete successfully"
    #booksのページへリダイレクト
    redirect_to books_path
  end

  def update
    #bookへidに対応したインスタンス変数を作成
    @book = Book.find(params[:id])
    #更新後ののBook_paramsの内容を格納し、更新
    if @book.update(book_params)
      #成功した場合その旨のフラッシュメッセージを追加
      flash[:notice] = "update successfully"
      #Idに対応するBookのShow画面へリダイレクト
      redirect_to book_path(@book.id)
    else
      #失敗した場合はrenderを用いてリダイレクトする
      render :edit
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
