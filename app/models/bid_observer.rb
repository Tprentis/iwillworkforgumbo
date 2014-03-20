class BidObserver < ActiveRecord::Observer
  def after_create(bid)
    Notifier.bid_added(bid).deliver
  end
  
  def after_update(bid)
    Notifier.bid_accepted(bid).deliver
  end
end
