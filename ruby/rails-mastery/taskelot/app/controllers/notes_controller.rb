class NotesController < ApplicationController
  http_basic_authenticate_with name: 'zmd', password: 'secret', only: :destroy

  def create
    @todo = Todo.find(params[:todo_id])
    @note = @todo.notes.create(note_params)
    redirect_to todo_path(@todo)
  end

  def destroy
    @todo = Todo.find(params[:todo_id])
    @note = @todo.notes.find(params[:id])
    @note.destroy
    redirect_to todo_path(@todo)
  end

  private

  def note_params
    params.require(:note).permit(:note)  # params[:note][:note]
  end
end
