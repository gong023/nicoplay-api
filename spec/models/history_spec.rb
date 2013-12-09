require 'spec_helper'

describe History do
  let(:sample_date) { "2013-01-01 00:00:00" }

  describe "#page_formatted" do
    subject { described_class.page_formatted(index) }

    context "with 30 valid record" do
      before { FactoryGirl.create_list(:history, 30) }

      context "with page 1" do
        let(:index) { 1 }
        it { expect(subject.size).to be 20 }
      end

      context "with page 2" do
        let(:index) { 2 }
        it { expect(subject.size).to be 10 }
      end

      context "with page 3" do
        let(:index) { 3 }
        it { expect(subject.size).to be 0 }
      end
    end

    context "with invalid record" do
      before { FactoryGirl.create(:history, state: 2) }
      let(:index) { 1 }
      it { expect(subject).to eq [] }
    end

    context "with no record" do
      let(:index) { 1 }
      it { expect(subject).to eq [] }
    end
  end

  describe "#format" do
    subject { described_class.format(history) }
    context "with success" do
      before { described_class.stub(:create_path).and_return "dummy_path" }
      let(:history) { FactoryGirl.create_list(:history, 2) }

      it "return array with title" do
        subject.each_with_index do |h, i|
          expect(h).to have_key(:title)
          expect(h[:title]).to eq history[i][:title]
        end
      end

      it "return array with path" do
        subject.each_with_index do |h, i|
          expect(h).to have_key(:path)
        end
      end
    end
  end

  describe "#create_path" do
    context "with correctly get date" do
      subject { described_class.create_path(history) }
      before { described_class.stub(:parse_to_Ymd).and_return("2013-01-01") }
      let(:history) { FactoryGirl.build(:history) }

      it { expect(subject).to match /^#{described_class::MEDIA_ROOT}/ }

      it { expect(subject).to match /2013-01-01/ }

      it { expect(subject).to match /#{history.video_id}\.mp3$/ }
    end
  end

  describe "#parse_to_Ymd" do
    subject { described_class.parse_to_Ymd(date) }
    context "with matched" do
      let(:date) { FactoryGirl.build(:history, created_at: sample_date).created_at }
      it { expect(subject).to eq "2013-01-01" }
    end

    context "with not matched" do
      let(:date) { "wrong" }
      it { expect(subject).to eq "" }
    end
  end
end
