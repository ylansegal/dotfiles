require 'spec_helper'

RSpec.describe 'git account' do
  it 'finds github account for current repo' do
    expect(%x{ git account }).to eq(<<~UNIX)
      ylansegal
    UNIX
  end
end
