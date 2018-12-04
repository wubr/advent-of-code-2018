require_relative 'claim'

fabric = setup_claims!
overlapped_units = 0

fabric.each do |_row_index, row_values_hash|
  overlapped_units += row_values_hash.values.select {|val| val > 1}.count
end

puts overlapped_units