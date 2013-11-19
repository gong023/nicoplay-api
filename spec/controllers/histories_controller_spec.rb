require 'spec_helper'

describe HistoriesController do
  subject { described_class.new }

  describe "#show" do
    context "within 15 days" do
      before { FactoryGirl.create(:history, created_at: Time.now.to_s) }
      it "get a record" do
        expect(subject.show.size).to be 1
      end
    end

    context "not within 15 days" do
      before { FactoryGirl.create(:history, created_at: "1970-01-01 00:00:00") }
      it "doesn't get a record" do
        expect(subject.show.size).to be 0
      end
    end

    context "with state uploaded" do
      before { FactoryGirl.create(:history, state: 3) }
      it "get a record" do
        expect(subject.show.size).to be 1
      end
    end

    context "with state not uploaded" do
      before { FactoryGirl.create(:history, state: 0) }
      it "doesn't get a record" do
        expect(subject.show.size).to be 0
      end
    end
  end
end
