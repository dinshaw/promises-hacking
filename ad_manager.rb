class AdManager
  attr_accessor :ad

  def initialize(ad)
    @ad = ad
  end

  def create_ad_account
    ad.name = 'Bill'
  end

  def publish(arg)
    ad.name = arg + 'publish'
  end

  def create_audience(arg)
    ad.name = arg + 'create_audience'
  end

  def create
    Promise.new(method(:create_ad_account)).
      then([method(:publish), method(:create_audience)])
    # then(activate_account).
    # catch(log_error)
  end
end
