class LinksController < ApplicationController
  def index
    @links = Link.all
  end
  
  def shorten
    @short_name = (0...5).map{ (0..9).to_a[rand(10)].to_s+('a'..'z').to_a[rand(26)] }.join
  end
  
  def show
    @link = Link.find(params[:id])
  end
  
  def match
    a = Link.find_by_short_name(params[:slug])
    redirect_to(a.name)
  end
  
  def clean(url)
    "http://" + url.gsub(/http:\/\/|https:\/\/|www./, "")
  end

  def create
   @link = Link.new(:name => clean(params[:link][:name]))
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
