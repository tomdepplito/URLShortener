class Link < ActiveRecord::Base
  attr_accessible :name, :short_name
  validates_uniqueness_of :name
  def shortener
    @short_name = (0...5).map{ (0..9).to_a[rand(10)].to_s+('a'..'z').to_a[rand(26)] }.join
  end
end