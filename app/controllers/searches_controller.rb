class SearchesController < ApplicationController
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
end
