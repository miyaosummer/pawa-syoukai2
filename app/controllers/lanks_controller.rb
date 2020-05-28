class LanksController < ApplicationController
  def index
    @basics = Basic.all
    @mem = Basic.where(name:'共感力')
    @mote = Basic.where(name:'モテ力')
    @kikaku = Basic.where(name:'企画力')
    @tyotiku = Basic.where(name:'貯蓄')
    @kouhuku = Basic.where(name:'幸福度')
    @kidu = Basic.where(name:'気遣い力')
    @mazi = Basic.where(name:'真面目度')
    @omo = Basic.where(name:'面白さ')
    @ki = Basic.where(name:'気が利く')
    @aka = Basic.where(name:'明るさ')
    @komyu = Basic.where(name:'コミュ力')
  end

  def show
    @user = User.find(params[:id])
    @basics = Basic.all
    @num = 0
  end


end
