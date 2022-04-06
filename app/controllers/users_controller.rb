class UsersController < ApplicationController
  before_action :authenticate_user!
  # sign_inしているユーザーのみ入れる

  def index
    # 全ユーザーの全投稿を表示
    @book = Book.find(params[:id])
  end

  # 必要なのは特定のユーザー(currentとは限らない)と、その本すべて
  def show
    # 《投稿フォーム用》
    @new_book = Book.new
    @user = current_user
    # 既存の本、↑↓同じユーザーとは限らない
    @id_user = User.find(params[:id])
    # ↓一覧表示のためのインスタンス変数(15章)
    @books = @id_user.books
  end

  def edit
  end
end
