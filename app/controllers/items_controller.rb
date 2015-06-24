class ItemsController < ApplicationController

  def create

    @user = current_user
    @item = @user.items.build(item_params)
    if @item.save
      @new_item = Item.new
      flash[:notice] = "Comment created successfully."
    else
      flash[:error] = "There was an error saving comment. Please try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      flash[:notice] = "Item deleted successfully."
    else
      flash[:error] = "There was an error deleting item."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end