class PagesController < ApplicationController

  def index
    @pages = Page.nested_set.all
  end

  # nested_set          - up: obj.move_left
  # reversed_nested_set - up: obj.move_right
  def up
    @page = Page.find(params[:id])
    @page.move_left
    flash[:notice] = t('pages.moved_up')
    redirect_to(root_path)
  end

  # nested_set          - down: obj.move_right
  # reversed_nested_set - down: obj.move_left
  def down
    @page = Page.find(params[:id])
    @page.move_right
    flash[:notice] = t('pages.moved_down')
    redirect_to(root_path)
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to(@page, :notice => 'Page was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to(@page, :notice => 'Page was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(pages_url)
  end
end
