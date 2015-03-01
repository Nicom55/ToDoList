class ListsController < ApplicationController
  
  def index
    @lists = List.all.order("created_at DESC")
  end
  
  def show
    @list = List.find(params[:id])
    @items = @list.items.order("created_at DESC")
    @new_item = Item.new
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      @errors = @list.errors
      render :new
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end
  
  private
  def list_params
    params.require(:list).permit(:title)
  end
  
end
