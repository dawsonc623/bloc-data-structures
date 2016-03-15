# FNV contains implementations of the FNV hashing algorithm
class FNV
  def self.fnv_1a(string)
    string_characters = string.unpack('U*')

    # 64-bit FNV offset basis
    hash = 14_695_981_039_346_656_037

    string_characters.each do |character|
      hash = hash ^ character

      # 64-bit FNV prime
      hash *= 1_099_511_628_211
    end

    hash
  end
end
