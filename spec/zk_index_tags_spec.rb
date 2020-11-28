require "spec_helper"
require "tmpdir"

RSpec.describe "zk_index_tags" do
  let(:zk_home) { Dir.mktmpdir }

  before do
    Dir.mkdir(File.join(zk_home, "Clips"))

    File.write File.join(zk_home, "Clips", "01-Note.md"), <<~MARKDOWN
      [[Tags/red]]
      [[Tags/blue]]

      Some other contents that should not be parsed
      # Some titles
      [A link](http:///not.parsed.come)
    MARKDOWN

    File.write File.join(zk_home, "Clips", "02-Note.md"), <<~MARKDOWN
      [[Tags/red]]
      [[Tags/blue]]
      [[Tags/yellow]]

      ```ruby
      1 + 1
      ```
    MARKDOWN

    File.write File.join(zk_home, "Clips", "03-Note.md"), <<~MARKDOWN
      [[Tags/yellow]]

      ---

      Some other content
    MARKDOWN
  end

  it "generates Tags.md, and individual tag files" do
    `ZK_HOME=#{zk_home} zk_index_tags`

    tag_index_contents = File.read(File.join(zk_home, "Tags.md"))
    expect(tag_index_contents).to eq <<~MARKDOWN
      [[Tags/blue]]
      [[Tags/red]]
      [[Tags/yellow]]
    MARKDOWN

    red_contents = File.read(File.join(zk_home, "Tags", "red.md"))
    expect(red_contents).to eq <<~MARKDOWN
      # Used in:
      [[Clips/01-Note]]
      [[Clips/02-Note]]

      # Tags Cross Reference:
      2 [[Tags/blue]]
      1 [[Tags/yellow]]
    MARKDOWN

    blue_contents = File.read(File.join(zk_home, "Tags", "blue.md"))
    expect(blue_contents).to eq <<~MARKDOWN
      # Used in:
      [[Clips/01-Note]]
      [[Clips/02-Note]]

      # Tags Cross Reference:
      2 [[Tags/red]]
      1 [[Tags/yellow]]
    MARKDOWN

    yellow_contents = File.read(File.join(zk_home, "Tags", "yellow.md"))
    expect(yellow_contents).to eq <<~MARKDOWN
      # Used in:
      [[Clips/02-Note]]
      [[Clips/03-Note]]

      # Tags Cross Reference:
      1 [[Tags/blue]]
      1 [[Tags/red]]
    MARKDOWN
  end
end
