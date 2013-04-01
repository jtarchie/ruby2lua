require 'spec_helper'

describe "When declaring functions" do
  it "can be invoked" do
    run!(%q{
      def value
        1
      end
      value
    }).should == 1
  end
end