class ResultsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
 
  
  def create
     @result = current_user.results.build(result_params)
    if @result.save
      flash[:success] = "登録しました"
      redirect_to root_url
    end
  end

  def destroy
    @result.destroy
    flash[:success] = '登録から削除しました。'
    redirect_to root_url
  end
  
  private
  
  def result_params
    params.require(:result).permit(:content)
  end
  
  def correct_user
    @result = current_user.results.find_by(id: params[:id])
    unless @result
      redirect_to root_url
    end
  end
  
end
