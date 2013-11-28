require 'spec_helper'

describe History do
  subject { described_class }
  let(:sample_date) { "2013-01-01 00:00:00" }

  describe "#page_formatted" do
    context "with 30 record" do
      before { FactoryGirl.create_list(:history, 30)}
      context "with page 1" do
        it "return only 20" do
          expect(subject.page_formatted(1).size).to be 20
        end
      end
      context "with page 2" do
        it "return 10" do
          expect(subject.page_formatted(2).size).to be 10
        end
      end
    end
  end

  describe "#format" do
    context "with success" do
      before { described_class.stub(:create_path).and_return "dummy_path" }
      let(:history) { FactoryGirl.create_list(:history, 2) }
      let(:result) { described_class.format(history) }

      it "return array with title" do
        result.each_with_index do |h, i|
          expect(h).to have_key(:title)
          expect(h[:title]).to eq history[i][:title]
        end
      end

      it "return array with path" do
        result.each_with_index do |h, i|
          expect(h).to have_key(:path)
        end
      end
    end
  end

  describe "#create_path" do
    context "with correctly get date" do
      before { described_class.stub(:parse_to_Ymd).and_return("2013-01-01") }
      let(:history) { FactoryGirl.build(:history) }
      let(:result) { subject.create_path(history) }

      it "contains ::MEDIA_ROOT" do
        expect(result).to match /^#{described_class::MEDIA_ROOT}/
      end

      it "contains date" do
        expect(result).to match /2013-01-01/
      end

      it "contains video_id" do
        expect(result).to match /#{history.video_id}\.mp3$/
      end
    end
  end

  describe "#parse_to_Ymd" do
    let(:history) { FactoryGirl.build(:history, created_at: sample_date) }
    context "with matched" do
      it "return Ymd" do
        expect(subject.parse_to_Ymd(history.created_at)).to eq "2013-01-01"
      end
    end

    context "with not matched" do
      it "return empty string" do
        expect(subject.parse_to_Ymd("wrong")).to eq ""
      end
    end
  end
end
