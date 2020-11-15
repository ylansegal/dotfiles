require "spec_helper"

RSpec.describe "zk_file_to_link" do
  it "generates a wiki link from a single file name" do
    input = "Clips/2020-05-10-SomeGreatTitle.md"

    output = `echo #{input} | zk_file_to_link`
    expect(output).to eq("[[Clips/2020-05-10-SomeGreatTitle]]\n")
  end

  it "generates wiki links from a list of file names" do
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

    output = `echo "#{input.strip}" | zk_file_to_link`

    expect(output).to eq(expected_output)
  end
end
