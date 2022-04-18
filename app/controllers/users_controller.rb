class UsersController < ApplicationController
  $numbers= User.count

  require 'date'
  $date = Date.today
  $year= $date.year
  $month= $date.month
  $day= $date.day
  

  def index
    @users = User.all
  end

  def new
    @user = User.new

  end

    def create
      @user = User.new(params.require(:user).permit(:title, :start_date, :end_date, :all_day, :update_at,:memo))
      if @user.save
        redirect_to :users
        flash[:notice] = "スケジュールを新規登録しました"
          if @user.all_day
             @allflag = "○"
          else
             @allflag = " "
          end
        $numbers= User.count
      else
        render "new"
      end
    end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permitpermit(:title, :start_date, :end_date, :all_day, :update_at,:check,:memo))
      flash[:notice] = "ユーザーIDが「#{@user.id}」の情報を更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to :users
  end

end

