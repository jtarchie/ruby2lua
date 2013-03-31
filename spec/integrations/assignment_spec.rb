require 'spec_helper'

describe "When using variables" do
  context "and assigning a value" do
    context "with a literal" do
      it "returns the literal value" do
        run!("age=1").should == 1
        run!("age=10.01").should == 10.01
      end
    end

    context "with an expression" do
      it "returns the expression value" do
        run!("age=1+1").should == 2
        run!("age=55.5/5").should == 11.1
      end
    end
  end

  context "and evaluating in an expression" do
    context "with a literal" do
      it "returns a liternal value" do
        run!("age=1; age+1").should == 2
        run!("age=2.0; age*4").should == 8.0
      end
    end

    context "with itself" do
      it "returns the literal value assigned to the variable" do
        run!("age=1; age+age").should == 2.0
        run!("age=1; age+age*4").should == 5
      end
    end
  end
end