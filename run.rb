require './ad.rb'
require './promise.rb'
require './ad_manager.rb'
ad = Ad.new
ad.name
mgr = AdManager.new(ad)
mgr.create
p ad
