# encoding: UTF-8

require 'spec_helper'

describe Cloze::Deletion do
  before(:all) do
    String.send :include, Cloze::Deletion
  end

  describe '.cloze_delete' do
    it 'cloze deletes each character' do
      arr = "foo".cloze_delete(:each) 
      arr.should == ['#oo','f#o','fo#']
    end

    it 'cloze deletes the whole string' do
      arr = "foo".cloze_delete(:all)
      arr.should == ['###']
    end

    it 'cloze deletes each character and the whole string' do
      arr = "foo".cloze_delete(:each, :all) 
      arr.should == ['#oo','f#o','fo#','###']
    end

    it 'cloze deletes kanji only' do
      arr = "巻き込む".cloze_delete(:kanji) 
      arr.should == ['#き込む','巻き#む']
    end

    it 'cloze deletes kanji and the whole string' do
      arr = "巻き込む".cloze_delete(:kanji, :all)
      arr.should == ['####','#き込む','巻き#む']
    end

    it 'cloze deletes with a different separator' do
      arr = "foo".cloze_delete(:each, with: '?')
      arr.should == ['?oo','f?o','fo?']
    end

    it 'defaults to :each if no args are supplied' do
      arr = "foo".cloze_delete
      arr.should == ['#oo','f#o','fo#']
    end
  end

  describe '.cloze' do
    it 'is an alias for .cloze_delete' do
      # arr = "foo".cloze
      # arr.should == ['#oo','f#o','fo#']
    end
  end

  describe '#default_deletion_character=' do
    it 'changes the default deletion character' do
      Cloze::Deletion.default_deletion_character = '?'

      arr = "foo".cloze_delete(:each)
      arr.should == ['?oo','f?o','fo?']

      arr = "foo".cloze_delete(:each, with: '#') 
      arr.should == ['#oo','f#o','fo#']
    end
  end

  describe '#included' do
    it 'raises a TypeError when included in a non-String class' do
      expect{
        class Array
          include Cloze::Deletion
        end
      }.to raise_error(TypeError)
    end
  end
end
