require 'spec_helper'

describe Redis do
  let(:redis) { Redis.new }
  let(:event) { @events.pop }
  subject { event.payload }

  before(:all) do
    @events     = []
    ActiveSupport::Notifications.subscribe('query.redis') do |*args|
      @events << ActiveSupport::Notifications::Event.new(*args)
    end
  end

  context "set" do
    before { redis.set("mykey", "hello world") }

    it { should == {:query => [[:set, "mykey", "hello world"]]} }

    it "should correctly set and get the key" do
      redis.get("mykey").should == 'hello world'
    end
  end

  context "get" do
    before { redis.get("mykey") }

    it { should == {:query => [[:get, "mykey"]]} }
  end
end
