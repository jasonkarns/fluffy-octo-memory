require "rails_helper"

RSpec.describe ReproMailer, type: :mailer do
  it "should repro" do
    expect {
      ReproMailer.with(inquiry: Inquiry.new(id: 1)).message.deliver_later
    }.to have_enqueued_email(ReproMailer, :message)
  end
end
