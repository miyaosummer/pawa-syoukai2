class BasicsController < ApplicationController

  def index
  end
  

  def edit
    @basics = Basic.find(params[:id])
  end

  def new
    @basic = Basic.new
    @basics = Basic.all
  end

  def create
    basic = Basic.new(post_params)
    basic_record =Basic.find_by(name: basic.name,user_id: current_user.id)
    user = User.find(current_user.id)
    if user.basics.count < 6
      if basic_record.blank?
        if basic.save
          redirect_to new_basic_path
          flash[:success] = '基礎能力を追加しました'
        else
          redirect_to new_basic_path
          flash[:delete] = '基礎能力を追加できませんでした。数値が100以下だったか・空欄・重複がなかったか。確かめてみてね。'
        end
      elsif basic_record.user_id == current_user.id
        redirect_to new_basic_path
        flash[:delete] = '基礎能力を追加できませんでした。同じ名前の基礎能力は登録できません・・・。'
      else
        if basic.save
          redirect_to new_basic_path
          flash[:success] = '基礎能力を追加しました'
        else
          redirect_to new_basic_path
          flash[:delete] = '基礎能力を追加できませんでした。数値が100以下だったか・空欄・重複がなかったか。確かめてみてね。'
        end
      end
    else
      redirect_to new_basic_path
      flash[:delete] = '基礎能力を追加できませんでした。登録できる基礎能力は6つまでです。どれかを削除してから再登録してください'
    end

  end

  def update
    @basics = Basic.find(params[:id])
    @basics.update(post_params)
    if @basics.save
      redirect_to user_path(current_user.id)
      flash[:success] = '基礎能力を更新しました'
    else
      redirect_to user_path(current_user.id)
      flash[:delete] = '基礎能力を更新できませんでした。数値が100以下だったか・空欄・重複がなかったか。確かめてみてね。'
    end
  end

  def destroy
    @basics = Basic.find(params[:id])
    @basics.destroy
    redirect_to user_path(current_user.id)
    flash[:delete] = '基礎能力を削除しました'
  end

  def show
    @basics = Basic.find(params[:id])
  end

  private
  def post_params
    params.require(:basic).permit(:name,:number).merge(user_id: current_user.id)
  end

end
