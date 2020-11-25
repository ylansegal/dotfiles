require "spec_helper"

RSpec.describe "zk_link_to_file" do
  it "generates a file name from a single wiki link" do
    input = "[[Clips/2020-05-10-SomeGreatTitle]]"

    output = `echo #{input} | zk_link_to_file`
    expect(output).to eq("Clips/2020-05-10-SomeGreatTitle.md\n")
  end

  it "generates wiki links from a list of file names" do
    input = <<~OUTPUT
      [[Clips/2020-05-10-SomeGreatTitle]]
      [[Procore/Tickets/FINF-1345]]
      [[Naked]]
    OUTPUT

    expected_output = <<~INPUT
      Clips/2020-05-10-SomeGreatTitle.md
      Procore/Tickets/FINF-1345.md
      Naked.md
    INPUT

    output = `echo "#{input.strip}" | zk_link_to_file`

    expect(output).to eq(expected_output)
  end
end
