require 'spec_helper'

RSpec.describe 'io' do
  context 'when invoking a generic unix utility' do
    it "the utility output is preceeded by '# '" do
      expect(%x{ echo "hello" | io sed 's/o/0/' }).to eq(<<~UNIX)
        hello
        # hell0
      UNIX
    end
  end

  context 'when invoking psql' do
    it "the utility output is preceeded by '-- '" do
      expect(%x{ echo "SELECT 42" | io psql --tuples-only --no-psqlrc }).to eq("SELECT 42\n--        42\n-- \n")
    end
  end
end
