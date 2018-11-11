class SearchesController < ApplicationController
  def new; end

  def create
    @search = Search.new(search_params)
    if @search.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def search_params
    params.require(:search).permit(:term)
  end
end
