module Cloze::JapaneseStringHelpers
  def kanji?
    has_kanji = false

    self.each_char do |ch|
      KANJI_RANGES.each do |range|
        has_kanji = true if range.include? ch.utf_to_i
      end
    end
    
    has_kanji
  end

# private
  KANJI_RANGES = [
    0x3400..0x9FFF,
    0x20000..0x2A6DF,
    0xF900..0xFAFF,
    0x2F800..0x2FA1F 
  ]

  def utf_to_i
    raise "Must be called on single character String" unless self.size == 1
    self.unpack("U").first
  end
end
