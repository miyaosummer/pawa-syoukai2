class SpecialsController < ApplicationController
  
  def index
    @basics = Basic.all
    @users = User.all
    @specials = Special.all
  end

  def new
    @special = Special.new
  end

  def create
    special = Special.create(post_params)
    if special.save 
      redirect_to user_path(current_user.id)
      flash[:success] = '特殊能力を追加しました'
    else
      redirect_to user_path(current_user.id)
      flash[:delete] = '特殊能力を追加できませんでした。能力・ボタンが正しく選べているか、重複がないかもう一度やってみてね'
    end
  end

  def destroy
    @special = Special.find(params[:id])
    @special.destroy
    redirect_to user_path(current_user.id)
    flash[:delete] = '特殊能力を削除しました'
  end


  private
  def post_params
    params.require(:special).permit(:name).merge(user_id: current_user.id)
  end
end
