class SnippetsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    @snippet.user = current_user
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

  def edit
    @snippet = Snippet.find(params[:id])
    if cannot? :manage, @snippet
      redirect_to snippet_path(@snippet), alert: 'Access Denied!'
    end
  end

  def update
    @snippet = Snippet.find(params[:id])
    if cannot? :manage, @snippet
      redirect_to snippet_path(@snippet), alert: 'Access Denied!'
    elsif @snippet.update snippet_params
      redirect_to snippet_path(@snippet), notice: 'Saved snippet changes.'
    else
      render :edit
    end
  end

  private

  def snippet_params
    params.require(:snippet).permit(:title, :code, :language_id, :description, :privacy)
  end

end
