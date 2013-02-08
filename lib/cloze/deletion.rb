require 'cloze/japanese_string_helpers'

require 'active_support/core_ext/array/extract_options'

module Cloze::Deletion
  def cloze_delete(*args)
    opts = args.select {|arg| arg.is_a? Symbol}
    char = args.extract_options![:with] || Cloze::Deletion.default_deletion_character

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
      self.split('').each_with_index do |_, i|
        str    = self.clone
        str[i] = char
        strs  << str
      end
    end

    strs
  end

private
  def cloze_delete_each(char)
  end

  def self.default_deletion_character
    '#'
  end

  def self.included(base)
    raise TypeError, "#{self} must be included in String or one of its subclasses" unless base <= String
  end
end
