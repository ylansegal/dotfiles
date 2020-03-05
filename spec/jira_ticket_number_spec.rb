require "spec_helper"

RSpec.describe "jira_ticket_number" do
  JIRA_TRUTH_TABLE = {
    "CF-7847/tc/woc_line_item_fk_validation" => "CF-7847",
    "PSI-2534" => "PSI-2534",
    "ys/CF-8176_rework_request_sweeper" => "CF-8176",
    "ys/CF-7996_upgrade_ruby_2.6" => "CF-7996"
  }.freeze

  JIRA_TRUTH_TABLE.each do |input, expected_output|
    it "it extracts #{expected_output} from #{input}" do
      output = `jira_ticket_number #{input}`
      expect(output).to eq("#{expected_output}\n")
    end
  end
end
