require "spec_helper"
require 'date'

RSpec.describe "clip_title" do
  TRUTH_TABLE = {
    "Millions of tiny databases" => "#{Date.today}-MillionsOfTinyDatabases",
  }

  TRUTH_TABLE.each do |input, expected_output|
    it "generates a title suitable for clipping" do
      output = %x{clip_title #{input}}
      expect(output).to eq("#{expected_output}\n")
    end
  end

  it 'handles input from standin' do
    output = %x{echo "harry potter" | clip_title}
    expect(output).to eq("#{Date.today.to_s}-HarryPotter\n")
  end
end
