require "spec_helper"

RSpec.describe "md_table" do
  context "when arguments are given" do
    it "generates a blank markdown table with appropriate columns and rows" do
      output = `md_table`
      expect(output).to eq <<~TEXT
        |   |   |
        |---|---|
        |   |   |
        |   |   |
      TEXT
    end
  end

  context "when no arguments are give" do
    it "generates a markdown table with 3 columns and 2 rows" do
      output = `md_table 3 2`
      expect(output).to eq <<~TEXT
        |   |   |   |
        |---|---|---|
        |   |   |   |
        |   |   |   |
      TEXT
    end
  end
end
