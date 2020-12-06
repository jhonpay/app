class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @result = current_user.results.build
    @results = current_user.results.order(id: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to login_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root 
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
