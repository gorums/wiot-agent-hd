require 'spec_helper'

describe Wiot::Hdmonitor do
  it 'has a version number' do
    expect(Wiot::Hdmonitor::VERSION).not_to be nil
  end

  it 'has a monitor hd' do
    expect(Wiot::Hdmonitor::monitor).to_not be nil
  end
end
