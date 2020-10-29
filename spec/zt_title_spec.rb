require "spec_helper"
require "date"

RSpec.describe "zt_title" do
  CLIP_TITLE_TRUTH_TABLE = {
    "Millions of tiny databases" => "#{Date.today}-MillionsOfTinyDatabases",
    "A successful Git branching model" => "#{Date.today}-ASuccessfulGitBranchingModel",
    "Build a Twitter with Rails, CableReady, and StimulusReflex" => "#{Date.today}-BuildATwitterWithRailsCableReadyAndStimulusReflex"
  }.freeze

  CLIP_TITLE_TRUTH_TABLE.each do |input, expected_output|
    it "generates a clip file title from command arguments (#{input})" do
      output = `zt_title #{input}`
      expect(output).to eq("#{expected_output}\n")
    end

    it "generates a clip file title from stdin (#{input})" do
      output = `echo #{input} | zt_title`
      expect(output).to eq("#{expected_output}\n")
    end
  end
end
