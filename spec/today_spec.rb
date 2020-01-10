require 'spec_helper'
require 'tmpdir'
require 'date'


RSpec.describe 'today' do
  def exec_today
    %x{NOTES_HOME=#{tmpdir} NOTES_EDITOR=echo source $HOME/.profile.d/today.sh && today}
  end

  let(:tmpdir) { Dir.mktmpdir }
  let(:last_note) {
    <<~MARKDOWN
      # Next
      - [ ] Not Done
      - [x] Done

      ---

      This should be trimmed!
    MARKDOWN
  }
  let(:new_note) {  File.read("#{tmpdir}/DailyLog/#{Date.today}.md") }

  before do
    Dir.mkdir(File.join(tmpdir, "DailyLog"))
    File.open("#{tmpdir}/DailyLog/2020-01-01.md", 'w') do |file|
      file << last_note
    end
  end

  it 'removes done things and creates a new note' do
    exec_today
    expect(new_note).to eq <<~MARKDOWN
      # Next
      - [ ] Not Done

    MARKDOWN
  end
end
