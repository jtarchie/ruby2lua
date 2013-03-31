require "spec_helper"

describe "Mathematical Operations" do
  describe "literal values" do
    it "returns the last evaluated integer" do
      run!("1").should == 1
      run!("10").should == 10
    end

    it "returns the the last evaluated floating point" do
      run!("1.1").should == 1.1
      run!("123.11").should == 123.11
    end
  end

  describe "arithmetic operators" do
    it "can add numbers" do
      run!("1+1").should == 2
      run!("2+10+0").should == 12
      run!("0+2").should == 2
    end

    it "can subtract numbers" do
      run!("1-1").should == 0
      run!("10-2-4").should == 4
      run!("2-0").should == 2
    end

    it "can multiply numbers" do
      run!("1*1").should == 1
      run!("100*0").should == 0
      run!("10*2*4").should == 80
      run!("3*3*3").should == 27
    end

    it "can divide numbers" do
      run!("1/1").should == 1
      run!("100/10").should == 10
      run!("10/2").should == 5
      run!("3/20").should == 0.15
    end

    context "handles order of operations" do
      it "with multiple operators" do
        run!("1+1*2").should == 3
        run!("10*10/5-1").should == 19
        run!("(10*5)/(5-1)").should == 12.5
      end
    end
  end
end
