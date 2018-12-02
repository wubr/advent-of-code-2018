count = 0

File.foreach('input') do |input|
  count += input.to_i
end

puts count