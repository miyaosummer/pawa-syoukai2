class SpecialsController < ApplicationController
  
  def index
    @basics = Basic.all
    @users = User.all
    @specials = Special.all
  end

  def new
    @special = Special.new
    @specials = Special.all

  end

  def create
    special = Special.new(post_params)
    special_record =Special.find_by(name: special.name,user_id: current_user.id)
    user = User.find(current_user.id)
    if user.specials.count < 16
      if special_record.blank? && special.save 
        redirect_to new_special_path
        flash[:success] = "特殊能力「#{special.name}」を追加しました"
      else
        redirect_to new_special_path
        flash[:delete] = '特殊能力を追加できませんでした。ボタンが正しく選べているか・重複がないか・１０文字以内か確かめてもう一度やってみてね'
      end
    else
      redirect_to new_special_path
      flash[:delete] = "特殊能力を追加できませんでした。登録できる特殊能力は16個までです。"
    end

  end

  def destroy
    @specials = Special.find(params[:id])
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "users" && path[:action] == "show"
      @specials.destroy
      redirect_to user_path(current_user.id)
      flash[:delete] = "特殊能力「#{@specials.name}」を削除しました"
    else
      @specials.destroy
      redirect_to new_special_path
      flash[:delete] = "特殊能力「#{@specials.name}」を削除しました"
    end
    
  end


  private
  def post_params
    params.require(:special).permit(:name).merge(user_id: current_user.id)
  end
end
