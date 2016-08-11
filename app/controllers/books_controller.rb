class BooksController < ApplicationController
  before_action :find_book, only: :show
  before_action :load_filter, only: :index

  def index
    @search_name = params[:search_name]
    @filter = params[:filter]
    if @filter == "title"
      @books = Book.search_book_by_title @search_name
    elsif @filter == "category"
      @category = find_category
      @books = Book.search_book_by_category @category
    else
      @books = Book.all
    end
    @books = @books.paginate page: params[:page], per_page: Settings.size
  end

  private
  def load_filter
    @filters = Book.filters
  end

  def find_category
    Category.find_category @search_name
  end

  def show
  end

  private
  def find_book
    @book = Book.find_by id: params[:id]
  end
end
