require 'spec_helper'

describe "When declaring functions" do
  it "can be invoked" do
    run!(%q{
      def age
        1
      end
      age
    }).should == 1
  end

  context "when the method has arguments" do
    it "can use those arguments in expressions" do
      run!(%q{
      def over_21?(age)
        age > 21
      end
      over_21?(22)
    }).should == true
    end
  end
end