class Notifier < ActionMailer::Base
  include ActionView::Helpers::NumberHelper
  default from: "hereisajob@iWillWorkForGumbo.com"


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(job, sender_name, receiver_email)
    @job = job
    @sender_name = sender_name
    @receiver_email = receiver_email

    mail :to => @receiver_email, :subject => "Here's a little job you might be interested in..."

 end

  def bid_added(bid)
    @job = bid.job
    mail :to => @job.member.email, :subject => "New bid for '#{@job.title}'", :body => "#{bid.body}\n\n#{bid.name}'s bid for #{number_to_currency(bid.bid_amount)} per #{bid.bid_per_rate} was created on #{bid.created_at.strftime("%d %b. %Y")}"
  end

  def bid_accepted(bid)
    @job = bid.job
    @member = Member.find(@job.member_id)
    mail :to => bid.email, :subject => "Congratulations #{bid.name}!! Your bid for '#{@job.title}' is ACCEPTED!!", :body => "Congratulations!! Your bid for '#{@job.title}' is ACCEPTED!!\n\nYour bid for #{number_to_currency(bid.bid_amount)} per #{bid.bid_per_rate} created on #{bid.created_at.strftime("%d %b. %Y")} is now ACCEPTED on #{bid.updated_at.strftime('%d %b. %Y')}\n\nPlease contact the offerer at #{@member.email}."
  end

  def comment_added(comment)
    @job = comment.commentable
    mail :to => @job.member.email, :subject => "New Stuff Said About: '#{@job.title}'", :body => "#{comment.content}\n\n was created on #{comment.created_at.strftime("%d %b. %Y")}"
  end
end
