require 'spec_helper'

describe 'routing' do
  describe 'GET /histories' do
    it { expect(get: '/histories/show').to route_to(controller: "histories", action: "show") }
    it { expect(get: '/histories/index').to route_to(controller: "histories", action: "index") }
  end
end
