box_ids = File.readlines('input', chomp: true)

# hat tip to https://stackoverflow.com/questions/8619785/what-is-an-efficient-way-to-measure-similarity-between-two-strings-levenshtein
def levenshtein(s1, s2)
  d = {}
  (0..s1.size).each do |row|
    d[[row, 0]] = row
  end
  (0..s2.size).each do |col|
    d[[0, col]] = col
  end
  (1..s1.size).each do |i|
    (1..s2.size).each do |j|
      cost = 0
      if (s1[i-1] != s2[j-1])
        cost = 1
      end
      d[[i, j]] = [d[[i - 1, j]] + 1,
                   d[[i, j - 1]] + 1,
                   d[[i - 1, j - 1]] + cost
      ].min
      # next unless @@damerau
      if (i > 1 and j > 1 and s1[i-1] == s2[j-2] and s1[i-2] == s2[j-1])
        d[[i, j]] = [d[[i,j]],
                     d[[i-2, j-2]] + cost
        ].min
      end
    end
  end
  return d[[s1.size, s2.size]]
end

box_ids.each_with_index do |box_id, index|
  ((index + 1)...box_ids.count).each do |other_index|
    other_box_id = box_ids[other_index]
    if levenshtein(box_id, other_box_id) == 1
      puts box_id
      puts other_box_id
      exit 0
    end
  end
end

puts 'woopsie doodle'