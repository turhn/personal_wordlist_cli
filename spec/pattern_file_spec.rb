require 'spec_helper'

describe PersonalWordlistCLI::PatternFile do
  before :each do
    allow(File).to receive(:read).and_return("'hello'")
  end

  subject { PatternFile.new('/dev/null') }

  it 'should evaluate the file content' do
    expect(subject.evaluate!.call).to eq 'hello'
  end
end
