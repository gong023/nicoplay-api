require 'spec_helper'

describe HistoriesController do
  subject { described_class.new }
  describe "#show" do
    context "with success" do
      it "not raise error" do
        expect {subject.show}.not_to raise_error
      end
    end
  end
end
