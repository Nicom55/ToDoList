class ItemsController < ApplicationController

  def create
    @list = List.find(params[:id])
    @item = @list.item.create(item_params)
    render @item
  end
  
  def update
    @list = List.find(params[:id])
    @item = Item.find(params[:id])
    if @item.update(item_params)
      #not sure about this since I want to use AJAX and stay on one page
      render item_path
    else
      @errors = @item.errors
      render :nothing => true
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @item = Item.find(params[:id])
    @item.destroy
    render :nothing => true
  end
  
  private
  def item_params
    params.require(:item).permit(:title)
  end
  
end
