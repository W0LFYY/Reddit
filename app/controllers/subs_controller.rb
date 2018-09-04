class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]
  def index
    @subs = Sub.all
    # render:index
  end

  def show
    #render :show
  end

  def new
    @sub = Sub.new
    render partial: "form"
  end
  
  def create
    @sub = Sub.new(sub_params)
    id @sub.save
    redirect_to subs_path
  else
    render :new
  end
  end

  def edit
  end
  
  def update
    if @sub.update(sub_paramas)
      redirect_to sub_path(@sub)
    else
      render :edit
    end

  end
  
  def destroy
    # @sub.destroy
    redirect_to subs_path
  end

  
  private 
    def set_sub
      @sub = Sub.find(params[:id])
    end
    
    def sub_params
      params.require(:sub).permit(:name)
    end



end
end