# -*- encoding : utf-8 -*-

class Phrase::Tool::EncodingDetector
  def self.file_seems_to_be_utf16?(file)
    file_seems_to_be_utf16_be?(file) or file_seems_to_be_utf16_le?(file)
  end

  def self.file_seems_to_be_utf16_be?(file)
    input = IO.read(file, 2)
    input and input.bytes.to_a == [0xFE, 0xFF]
  end

  def self.file_seems_to_be_utf16_le?(file)
    input = IO.read(file, 2)
    input and input.bytes.to_a == [0xFF, 0xFE]
  end
end
