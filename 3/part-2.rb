require_relative 'claim'

fabric = setup_claims!

File.foreach('input') do |input|
  matches = input.match(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/)
  claim_id = matches[1].to_i
  start_x = matches[2].to_i
  start_y = matches[3].to_i
  size_x = matches[4].to_i
  size_y = matches[5].to_i
  puts claim_id unless overlaps? fabric: fabric,
                                 start_x: start_x,
                                 start_y: start_y,
                                 size_x: size_x,
                                 size_y: size_y
end