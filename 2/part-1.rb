
def letter_instances(box_id:)
  letter_hash = {}
  box_id.each_char {|c| letter_hash[c] = (letter_hash[c] || 0) + 1}
  letter_hash
end

def checksum(threes:, twos:)
  threes * twos
end

threes = 0
twos = 0
box_ids = File.readlines('input', chomp: true)

box_ids.each do |box_id|
  letter_hash = letter_instances box_id: box_id
  threes += 1 if letter_hash.values.include?(3)
  twos += 1 if letter_hash.values.include?(2)
end

puts "Threes: #{threes}"
puts "Twos: #{twos}"
puts "Checksum: #{checksum(threes: threes, twos: twos)}"