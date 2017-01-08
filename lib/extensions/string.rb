require 'set'

class String
  def strip_special_characters
    self.gsub('-', ' ').gsub('&', '').gsub('.', '').gsub('/', '')
  end
end
