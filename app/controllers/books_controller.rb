class BooksController < ApplicationController

  def new
    @new_book = Book.new
  end

# Book.newとBook.new(book_params)はほぼ同義だけど、
# createとeditをするときは、(book_params)が必要になる！

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    # ↑新しい本のユーザーidに、ログイン中のユーザーidを使用
    @new_book.save
    # flash
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@new_book.id)
  end

  def index
    # 《投稿フォーム用》
    @new_book = Book.new
    @user = current_user
    # ↑今ログインしているユーザーの情報が表示できればいい！
    @books = Book.all
  end

  # 本の詳細、必要なのは特定の本と、その本のユーザーのみ
  def show
    # 《投稿フォーム用に必要》
    @new_book = Book.new
    @user = current_user
    # ↓すでに作った(既存の)本を表示
    @book = Book.find(params[:id])
  end

  def edit
    # すでに作った(保存されている)本を表示
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end


end
