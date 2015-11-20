require 'spec_helper'

describe DataFile do
  before :each do
    allow(File).to receive(:read).and_return('{"foo": "bar"}')
  end

  subject { DataFile.new("/dev/null") }

  it 'should return a symbolized hash' do
    expect(subject.parse_json).to eq :foo => "bar"
  end
end
