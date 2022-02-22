require "rails_helper"

class M
  include GlobalID::Identification

  def id
    1
  end
end
RSpec.describe ReproMailer, type: :mailer do
  it "should repro" do
    expect {
      ReproMailer.with(inquiry: M.new).message.deliver_later
    }.to have_enqueued_email(ReproMailer, :message)
  end
end
