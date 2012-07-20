class LinksController < ApplicationController
  def index
    @links = Link.all
  end
  
  def shorten
    @link.id.to_s
  end
  
  def show
    @link = Link.find(params[:id])
  end

  def create
   @link = Link.new(:name => params[:link][:name])
   @link.short_name = shorten
   if @link.save
     redirect_to(link_path(@link))
   else
     render :new
   end
  end

  def new
    @link = Link.new
  end

  def update
  end

  def destroy
  end
end
