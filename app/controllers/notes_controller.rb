class NotesController < ApplicationController
  def new
    @order = Order.find_by(id: params[:order_id])
    @note = @order.notes.build
  end
  
  def create
    @order = Order.find_by(id: params[:order_id])
    @note = @order.notes.create(note_params.merge(author: current_user))
    redirect_to order_path(@order)
  end
  
  private
  
  def note_params
    params.require(:note).permit(:content)
  end
end
