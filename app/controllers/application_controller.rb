class ApplicationController < ActionController::Base
  helper_method :navigation

  def navigation
    if request.path == root_path
      ["Search History", search_history_path]
    else
      ["Home", root_path]
    end
  end
end
