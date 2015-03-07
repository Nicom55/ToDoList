class ItemsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.create(item_params)
    redirect_to list_path(@list)
  end
  
  def update
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to list_path(@list)
    else
      @errors = @item.errors
      render :nothing => true
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @list = @comment.list
    @item.destroy
    redirect_to goal_path(@goal)
  end
  
  private
  def item_params
    params.require(:item).permit(:title)
  end
  
end
