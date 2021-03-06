require 'test_helper'

describe Minitest::MustWonted::Matcher::Magick do

  describe "plain calls" do

    it "must be handled correctly" do
      [].must be_empty
      [].must be_empty?

      [0].wont be_empty
      [0].wont be_empty?
    end

    it "must fail correctly" do
      assert_fails_correctly { [0].must be_empty  }
      assert_fails_correctly { [0].must be_empty? }
      assert_fails_correctly { [].wont be_empty   }
      assert_fails_correctly { [].wont be_empty?  }
    end

  end

  describe "calls with arguments" do
    class BeTest
      def tested?(one, two)
        one > two
      end
    end

    subject { BeTest.new }

    it "must handle params correctly" do
      must be_tested(2, 1)
      wont be_tested(1, 2)
    end

    it "must fail correctly" do
      assert_fails_correctly { must be_tested(1, 2) }
      assert_fails_correctly { wont be_tested(2, 1) }
    end
  end

  describe 'be_a/be_an matchers' do
    it "must handle them correctly" do
      '0'.must be_a(String)
      [0].must be_an(Array)

      '0'.wont be_an(Array)
      [0].wont be_a(String)
    end
  end

end
