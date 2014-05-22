# -*- encoding : utf-8 -*-

class Phrase::Tool::TagValidator
  FORMAT = /\A[a-zA-Z0-9\_\-\.]+\z/

  def self.valid?(tag_name)
    (tag_name.to_s =~ FORMAT)
  end
end
