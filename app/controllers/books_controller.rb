class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /books
  # GET /books.json
  def index
    if params[:filter] == 'own'
      @books = current_user.books
    else
      @books = Book.all
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @relationship = current_user.relationships.where(book: @book).first || NullRelationship.new(current_user)

    @friends_reviews = Relationship.includes(:user).where(book: @book, user_id: current_user.friends.pluck(:id))
    @other_reviews = Relationship.includes(:user).where(book: @book).all - @friends_reviews - [@relationship]
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recommendations
    @recommended = current_user.recommendations(4)
    # @recommended = Book.includes([:relationships => [:user => [:relationships => [:book]]]]).limit(4).to_a
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.includes([:users => [:books => [:users]]]).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :description, :isbn, :lang, :page_count, :published_in, :published_by, :author_id)
    end
end
