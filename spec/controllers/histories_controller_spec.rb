require 'spec_helper'

shared_examples "valid json response" do
  it { expect(response.status).to be 200 }
  it { expect(response.body).not_to be_empty }
  it { expect(parse_json(response.body)).to have_key 'list' }
  it { expect(parse_json(response.body)['list'].pop).to have_key "title" }
  it { expect(parse_json(response.body)['list'].pop).to have_key "path" }
end

shared_examples "allow access not same origin" do
  it { expect(response.header["Access-Control-Allow-Origin"]).to eq "http://localhost" }
  it { expect(response.header["Access-Control-Allow-Methods"]).to eq "GET" }
  it { expect(response.header["Access-Control-Allow-Headers"]).to eq "Content-Type, X-Requested-With" }
end

shared_context "request with valid history" do
  before { valid_history; request }
end

describe HistoriesController do
  let(:valid_history) { FactoryGirl.create_list(:history, 30) }
  describe "GET index" do
    context "with no parameter" do
      let(:request) { get :index, format: 'json' }
      include_context "request with valid history"
      it_behaves_like "valid json response"
      it_behaves_like "allow access not same origin"
      it { expect(parse_json(response.body)['list'].count).to be 20 }
    end
  end

  describe "GET show" do
    context "with id 1" do
      let(:request) { get :show, format: 'json', id: 1}
      include_context "request with valid history"
      it_behaves_like "valid json response"
      it_behaves_like "allow access not same origin"
      it { expect(parse_json(response.body)['list'].count).to be 20 }
    end
  end
end
