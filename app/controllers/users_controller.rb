class UsersController < ApplicationController

  before_action :ensure_current_user, {only: [:edit, :update]}

  def index
    # 《投稿フォーム用》
    @new_book = Book.new
    @user = current_user
    # 全ユーザーの全投稿を表示
    @users = User.all
  end

  # 必要なのは特定のユーザー(currentとは限らない)と、その本すべて
  def show
    # 《投稿フォーム用》
    @new_book = Book.new
    # ↓URLからユーザーの情報を取得する
    @id_user = User.find(params[:id])
    # ↓一覧表示のためのインスタンス変数(15章)
    @books = @id_user.books
    # = [変数.モデル名(アソシエーションで関連付られているから使える)]
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
      # (@user.id)のuserは変数の@user
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

   def ensure_current_user
    if current_user.id != params[:id].to_i
      # 「!=」＝「≠」
      # params[:id]は文字列型(String)、current_user.idは整数型(Integer)
      redirect_to("/users/sign_in")
    end
   end

end
