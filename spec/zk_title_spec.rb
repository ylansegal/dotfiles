require "spec_helper"
require "date"

RSpec.describe "zk_title" do
  zk_title_truth_table = {
    "Millions of tiny databases" => "#{Date.today}-MillionsOfTinyDatabases",
    "A successful Git branching model" => "#{Date.today}-ASuccessfulGitBranchingModel",
    "Build a Twitter with Rails, CableReady, and StimulusReflex" => "#{Date.today}-BuildATwitterWithRailsCableReadyAndStimulusReflex"
  }.freeze

  zk_title_truth_table.each do |input, expected_output|
    it "generates a clip file title from command arguments (#{input})" do
      output = `zk_title #{input}`
      expect(output).to eq("#{expected_output}\n")
    end

    it "generates a clip file title from stdin (#{input})" do
      output = `echo #{input} | zk_title`
      expect(output).to eq("#{expected_output}\n")
    end

    describe '--strip' do
      it 'generates output without a new line' do
        output = `zk_title --strip #{input}`
        expect(output).to eq("#{expected_output}")
      end
    end
  end
end
