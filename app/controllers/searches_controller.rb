class SearchesController < ApplicationController
  helper_method :sort_field, :sort_direction

  def index
    @searches = SearchHistory.order("#{sort_field} #{sort_direction}")
  end

  def show
    @search = Search.find_by(term: params[:term])
  end

  def new; end

  def create
    @search = Search.new(search_params)
    if @search.save
      redirect_to search_path(term: @search.term)
    else
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(:term)
  end

  def sortable_fields
    ["latest_date", "search_count", "term"]
  end

  def sort_field
    sortable_fields.include?(params[:field]) ? params[:field] : "term"
  end

  def sort_direction
    ["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
