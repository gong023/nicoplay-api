require 'spec_helper'

describe 'routing' do
  describe 'GET /histories' do
    it { expect(get: '/histories').to route_to(controller: "histories", action: "index", format: :json) }
    it { expect(get: '/histories/1').to route_to(controller: "histories", action: "show", id: "1", format: :json) }
  end
end
