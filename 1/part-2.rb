count = 0
frequencies = [0]

change_list = File.readlines('input', chomp: true)

change_list.cycle do |input|
  count += input.to_i
  if frequencies.include? count
    puts "First duplicate freq was #{count}"
    break
  else
    frequencies.push count
  end
end