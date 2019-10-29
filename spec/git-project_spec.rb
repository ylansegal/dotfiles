require 'spec_helper'

RSpec.describe 'git account' do
  it 'finds github project for current repo' do
    expect(%x{ git project }).to eq(<<~UNIX)
      dotfiles
    UNIX
  end
end
