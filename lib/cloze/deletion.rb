require 'active_support/core_ext/array/extract_options'

module Cloze::Deletion
  def cloze_delete(*args)
    opts = args.select {|arg| arg.is_a? Symbol}
    char = args.extract_options![:with] || Cloze::Deletion.default_deletion_character

    strs = []

    if opts.include? :each
    end

    # if opts.include? :all
    # if opts.include? :kanji

    strs
  end

private
  def self.default_deletion_character
    '#'
  end

  def self.included(base)
    raise TypeError, "#{self} must be included in String or one of its subclasses" unless base <= String
  end
end
