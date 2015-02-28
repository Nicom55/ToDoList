class ListsController < ApplicationController
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def new
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      @errors = @list.errors
      render :new
    end
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      @errors = @list.errors
      render :edit
    end
  end
  
  def delete
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end
  
  private
  def list_params
    params.require(:list).permit(:title)
  end
  
end
