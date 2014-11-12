class PostingsController < ApplicationController
  def index
    @postings = Posting.all
  end
  def show
    @posting = Posting.find_by_id(params[:id])
  end

  def new
    @posting = Posting.new
  end
  def create
    @posting = Posting.new(params_posting)
    if @posting.save
      flash[:notice] = "Posting Saved"
      redirect_to action: 'index'
    else
      flash[:error] = "Data not Valid"
      render 'new'
    end
  end

  def edit
    @posting = Posting.find_by_id(params[:id])
  end
  def update
    @posting = Posting.find_by_id(params[:id])
    if @posting.update(params_posting)
      flash[:notice] = "Data Updated"
      redirect_to action: 'index'
    else
      flash[:error] = "data not valid"
      render 'edit'
    end
  end

    def destroy
      @posting = Posting.find_by_id(params[:id])
      if @posting.destroy
        flash[:notice] = "Data deleted"
        redirect_to action: 'index'
      else
        flash[:error] = "data not valid"
        redirect_to action: 'index'
      end
    end

  def params_posting
    params.require(:posting).permit(:photo, :title, :userid)
  end
end
