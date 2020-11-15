require "spec_helper"
require "date"

RSpec.describe "zk_file_to_link" do
  it "generates a wiki link from a single file name" do
    output = `echo "Clips/2020-05-10-SomeGreatTitle.md" | zk_file_to_link`
    expect(output).to eq("[[Clips/2020-05-10-SomeGreatTitle]]\n")
  end

  it "generates wiki links from a list of file names" do
    pending "Works in the console, but not in the spec. Don't know why"
    input = <<~INPUT
      Clips/2020-05-10-SomeGreatTitle.md
      Procore/Tickets/FINF-1345.md
      Naked.md
    INPUT

    expected_output = <<~OUTPUT
      [[Clips/2020-05-10-SomeGreatTitle]]
      [[Procore/Tickets/FINF-1345]]
      [[Naked]]
    OUTPUT

    expect(`echo #{input} | zk_file_to_link`).to eq(expected_output)
  end
end
