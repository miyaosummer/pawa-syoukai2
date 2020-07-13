class BasicsController < ApplicationController

  def index
  end
  

  def edit
    @basics = Basic.find(params[:id])
    @@basics = Basic.find(params[:id])
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
          flash[:success] = "基礎能力「#{basic.name}」を追加しました"
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
          flash[:success] = "基礎能力「#{basic.name}」を追加しました"
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
    check_params = Basic.new(post_params)
    basic_record = Basic.where(name: check_params.name,user_id: current_user.id) #存在しない（blank?=true) ＝同一ユーザー内で変更後の基礎能力名はまだ存在していない
    binding.pry
    if basic_record.count == 0 #同一ユーザー内で変更後の基礎能力名が存在していない時
      if @basics.number == check_params.number#変更前後で数値が変わっていなければ
        redirect_to user_path(current_user.id)
      else
        if @basics.update(post_params)#値を更新できるか判断する。できた場合
          redirect_to user_path(current_user.id)
          flash[:success] = "基礎能力「#{@basics.name}」の数値を#{@@basics.number}から#{check_params.number}に変更しました。"
        else#値を更新できるか判断する。できなかった場合。
          redirect_to user_path(current_user.id)
          flash[:delete] = '基礎能力を更新できませんでした。数値が100以下だったか・空欄ではなかったか、確かめてみてね。'#文字数・数値の範囲で弾かれていることが想定される。
        end
      end#同一ユーザー内に変更後の基礎能力が自分含め存在しているが、１つしか存在していない（自分しかいない）場合
    elsif basic_record.count == 1
      if @basics.number == check_params.number
        redirect_to user_path(current_user.id)
      else
        if @basics.update(post_params)#値を更新できるか判断する。できた場合
          redirect_to user_path(current_user.id)
          flash[:success] = "基礎能力「#{@basics.name}」の数値を#{@@basics.number}から#{check_params.number}に変更しました。"
        else#値を更新できるか判断する。できなかった場合。
          redirect_to user_path(current_user.id)
          flash[:delete] = '基礎能力を更新できませんでした。数値が100以下だったか・空欄ではなかったか、確かめてみてね。'#文字数・数値の範囲で弾かれていることが想定される。
        end
      end
    else
      redirect_to user_path(current_user.id)
      flash[:delete] = '基礎能力を更新できませんでした。同じ名前の基礎能力は登録できません・・・。'
    end
  end

  def destroy
    @basics = Basic.find(params[:id])
    path = Rails.application.routes.recognize_path(request.referer)
    
    if path[:controller] == "users" && path[:action] == "show"
      @basics.destroy
      redirect_to user_path(current_user.id)
      flash[:delete] = "基礎能力「#{@basics.name}」を削除しました"
    else
      @basics.destroy
      redirect_to new_basic_path
      flash[:delete] = "基礎能力「#{@basics.name}」を削除しました"
    end

  end

  def show
    @basics = Basic.find(params[:id])
  end

  private
  def post_params
    params.require(:basic).permit(:name,:number).merge(user_id: current_user.id)
  end

end
