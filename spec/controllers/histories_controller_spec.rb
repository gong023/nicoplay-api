require 'spec_helper'

describe "Histories" do
  let(:env) do
    { "HTTP_ACCEPT" => "application/json" }
  end

  describe "#index" do
    context "within no page parameter" do
      before { FactoryGirl.create(:history) }
      it "get a record" do
        get :index, {}, env
        expect(response).to be 200
      end
    end

    context "not within 15 days" do
      before { FactoryGirl.create(:history, created_at: "1970-01-01 00:00:00") }
      xit "doesn't get a record" do
        expect(subject.index.size).to be 0
      end
    end

    context "with state uploaded" do
      before { FactoryGirl.create(:history, state: 3) }
      xit "get a record" do
        expect(subject.index.size).to be 1
      end
    end

    context "with state not uploaded" do
      before { FactoryGirl.create(:history, state: 0) }
      xit "doesn't get a record" do
        expect(subject.index.size).to be 0
      end
    end
  end
end
