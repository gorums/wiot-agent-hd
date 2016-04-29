require 'spec_helper'

describe Wiot::Agent::Hd do
  it 'has a version number' do
    expect(Wiot::Agent::Hd::VERSION).not_to be nil
  end

  it 'has a monitor hd' do
    expect(Wiot::Agent::monitor).to_not be nil
  end
end
