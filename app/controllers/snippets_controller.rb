class SnippetsController < ApplicationController

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    if @snippet.save
      redirect_to snippet_path(@snippet), notice: 'Snippet Saved!'
    else
      flash[:alert] = 'Snippet not saved.'
      render :new
    end
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def snippet_params
    params.require(:snippet).permit(:title, :work, :kind_id)
  end
end
