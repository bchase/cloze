# encoding: UTF-8

require 'spec_helper'

describe Cloze::JapaneseStringHelpers, focus: true do
  before(:each) do
    String.send :include, Cloze::JapaneseStringHelpers
  end

  describe '.kanji?' do
    context 'kanji' do
      it 'return true' do
        '漢字'.kanji?.should be_true
      end
    end

    context 'kana' do
      it 'return false' do
        'かな'.kanji?.should be_false
      end
    end

    context 'ascii' do
      it 'return false' do
        'foo'.kanji?.should be_false
      end
    end
  end
end
