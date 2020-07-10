class BasicsController < ApplicationController

  def index
  end
  

  def edit
    @basics = Basic.find(params[:id])
  end

  def new
    @basics = Form::BasicCollection.new
  end

  def create
    basic = Form::BasicCollection.new(post_params)
    # basic_record =Basic.find_by(name: basic.name,user_id: current_user.id)
    if basic.blank?
      if basic.save
        redirect_to user_path(current_user.id)
        flash[:success] = '基礎能力を追加しました'
      else
        redirect_to user_path(current_user.id)
        flash[:delete] = '基礎能力を追加できませんでした。数値が100以下だったか・空欄・重複がなかったか。確かめてみてね。'
      end
    elsif basic
      redirect_to user_path(current_user.id)
      flash[:delete] = '基礎能力を追加できませんでした。同じ名前の基礎能力は登録できません・・・。'
    else
      if basic.save
        redirect_to user_path(current_user.id)
        flash[:success] = '基礎能力を追加しました'
      else
        redirect_to user_path(current_user.id)
        flash[:delete] = '基礎能力を追加できませんでした。数値が100以下だったか・空欄・重複がなかったか。確かめてみてね。'
      end
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
    params.require(:form_basic_collection).permit(basics_attributes: :name, basics_attributes: :number)
  end

end
