class SnippetListsController < ApplicationController

def index
  @snippets = Snippet.all
  if params[:search]
    @snippets = Snippet.search(params[:search]).order(params[:sort_by])
  else
    @snippets = Snippet.order(:language_id)
  end

end

def show
  @language = Language.find_by(id: params[:id])
  @snippets = @language.snippets
end


end
