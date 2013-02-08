require 'cloze/japanese_string_helpers'

require 'active_support/core_ext/array/extract_options'
require 'active_support/core_ext/module/attribute_accessors'

module Cloze::Deletion
  mattr_accessor :default_deletion_character
  self.default_deletion_character = '#'

  def cloze_delete(*args)
    opts = args.select {|arg| arg.is_a? Symbol}
    opts = [:each] if opts.empty?
    char = args.extract_options![:with] || Cloze::Deletion.default_deletion_character
    # TODO ^ better var name

    strs = []

    if opts.include? :each
      # TODO extract to method
      self.split('').each_with_index do |_, i|
        str    = self.clone
        str[i] = char
        strs  << str
      end
    end

    if opts.include? :all
      strs << Array.new(self.size, char).join
    end

    if opts.include? :kanji
      self.split('').each_with_index do |ch, i|
        next unless ch.kanji?
        str    = self.clone
        str[i] = char
        strs  << str
      end
    end

    strs
  end

private
  def self.included(base)
    raise TypeError, "#{self} must be included in String or one of its subclasses" unless base <= String
    base.send :include, Cloze::JapaneseStringHelpers
  end
end
