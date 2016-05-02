require 'spec_helper'

describe WiotAgentHd do
  it 'has a version number' do
    expect(WiotAgentHd::VERSION).not_to be nil
  end

  it 'has a monitor hd' do
    expect(WiotAgentHd::monitor).to_not be nil
  end
end
