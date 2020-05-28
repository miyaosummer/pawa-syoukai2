class BasicsController < ApplicationController

  def index
  end
  

  def edit
    @basics = Basic.find(params[:id])
  end

  def new
    @basic = Basic.new
  end

  def create
    basic = Basic.create(post_params)
    if basic.save 
      redirect_to user_path(current_user.id)
      flash[:success] = '基礎能力を追加しました'
    else
      redirect_to user_path(current_user.id)
      flash[:delete] = '基礎能力を追加できませんでした。数値が100以下だったか・空欄・重複がなかったか。確かめてみてね。'
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

  private
  def post_params
    params.require(:basic).permit(:name,:number).merge(user_id: current_user.id)
  end

end
