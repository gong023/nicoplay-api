require 'spec_helper'

shared_examples "valid response" do
  it { expect(response.status).to be 200 }
  it { expect(response.body).not_to be_empty }
end

shared_examples "valid json format" do
  it { expect(parse_json(response.body).pop).to have_key "title" }
  it { expect(parse_json(response.body).pop).to have_key "path" }
end

shared_context "request with valid history" do
  before { valid_history; request }
end

describe HistoriesController do
  let(:valid_history) { FactoryGirl.create(:history) }
  describe "GET index" do
    context "with no parameter" do
      let(:request) { get :index, format: 'json' }
      include_context "request with valid history"
      it_behaves_like "valid response"
      it_behaves_like "valid json format"
    end
  end

  describe "GET show" do
    context "with no parameter" do
      let(:request) { get :show, format: 'json' }
      include_context "request with valid history"
      it_behaves_like "valid response"
      it_behaves_like "valid json format"
    end
  end
end
