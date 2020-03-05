require "spec_helper"
require 'date'

RSpec.describe "clip_title" do
  TRUTH_TABLE = {
    "Millions of tiny databases" => "#{Date.today}-MillionsOfTinyDatabases",
    "A successful Git branching model" => "#{Date.today}-ASuccessfulGitBranchingModel"
  }.freeze

  TRUTH_TABLE.each do |input, expected_output|
    it "generates a title suitable for clipping" do
      output = %x{clip_title #{input}}
      expect(output).to eq("#{expected_output}\n")
    end
  end

  it 'handles input from stdin' do
    output = %x{echo "harry potter" | clip_title}
    expect(output).to eq("#{Date.today.to_s}-HarryPotter\n")
  end
end
