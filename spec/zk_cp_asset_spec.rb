require "spec_helper"
require "tmpdir"

RSpec.describe "zk_cp_asset" do
  def exec_zk_cp_asset(file_path)
    `ZK_HOME=#{tmpdir} zk_cp_asset #{file_path}`
  end

  let(:tmpdir) { Dir.mktmpdir }
  let(:source_file_content) { "Hello\nThis is the file content" }
  let(:source_file_name) { "#{tmpdir}/File.#{extension}" }
  let(:extension) { 3.times { letters.sample } }
  let(:letters) { ("a".."z").to_a }

  before do
    Dir.mkdir(File.join(tmpdir, ".assets"))
    File.open(source_file_name, "w") do |file|
      file << source_file_content
    end
  end

  it "generates a UUID for the filename, with the same extension" do
    output = exec_zk_cp_asset(source_file_name)
    new_file = output.lines.first.strip
    expect(new_file).to match(%r{/.assets/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}\.#{extension}})
  end

  it "copies the given file to ZK_HOME/.asset" do
    output = exec_zk_cp_asset(source_file_name)
    new_file = output.lines.first.strip
    new_file_content = File.read(File.join(tmpdir, new_file))
    expect(new_file_content).to eq(source_file_content)
  end
end
