class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    shelf = params[:shelf]

    result, message = current_user.update_book(book, shelf)

    respond_to do |format|
      if result
        format.html { redirect_to book, notice: message }
      else
        format.html { redirect_to book, alert: message}
      end
    end
  end

  def update
    relationship = current_user.relationships.find(params[:id])
    book = Book.find(params[:book_id])

    if relationship
      relationship.update(relationship_params)
    end

    respond_to do |format|
      format.html { redirect_to book }
      format.json { respond_with_bip(relationship) }
    end
  end

  def star
    rel = current_user.relationships.find(params[:id])

    if rel
      rel.update_attribute(:favourite, !rel.favourite)
    end

    redirect_to :back
  end

  private

  def relationship_params
    params.require(:relationship).permit(:review, :feeling)
  end
end
