class NotesController < ApplicationController
  before_action :set_noteable

  def index
    @notes = @noteable.notes
  end

  def new
    @note = Note.new
  end

  def create
    @noteable.notes.create(note_params.merge(author: current_user))
    @notes = @noteable.notes
    flash[:notice] = "Note successfully created."
    render :index
  end

  private

  def note_params
    params.require(:note).permit(:content, :noteable_type, :noteable_id)
  end

  def set_noteable
    noteable_class = Object.const_get params[:note][:noteable_type]
    @noteable = noteable_class.find_by(id: params[:note][:noteable_id])
  end
end
