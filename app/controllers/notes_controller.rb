class NotesController < ApplicationController
  
  def index
    @noteable, @order = noteable
    @notes = @noteable.notes
  end
  
  def new
    @noteable, @order = noteable
    @note = @noteable.notes.build
    
    if @noteable == @order
      @form_objects = [@noteable, @note]
    else
      @form_objects = [@order, @noteable, @note]
    end
  end
  
  def create
    @noteable, @order = noteable
    @note = @noteable.notes.create(note_params.merge(author: current_user))
    redirect_to order_path(@order)
  end
  
  private
  
  def note_params
    params.require(:note).permit(:content)
  end
  
  def noteable
    if params[:line_item_id]
      [LineItem.find_by(id: params[:line_item_id]), Order.find_by(id: params[:order_id])]
    else
      [Order.find_by(id: params[:order_id]), Order.find_by(id: params[:order_id])]
    end
  end
  
end
