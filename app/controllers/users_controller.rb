class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(params_user)
    if @user.save
      flash[:notice] = "Succes add data"
      redirect_to action: 'index'
    else
      flash[:error] = "data not valid"
      render 'new'
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end
  def update
    @user = User.find_by_id(params[:id])
    if @user.update(params_user)
      flash[:notice]= "Success update data"
      redirect_to action: 'index'
    else
      flash[:error] = "Data not valid"
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    if @user.destroy
      flash[:notice]= "Success update data"
      redirect_to action: 'index'
    else
      flash[:error] = "Data not valid"
      redirect_to action: 'index'
    end
  end

  def params_user
    params.require(:user).permit(:name,:username,:password)
  end
end
