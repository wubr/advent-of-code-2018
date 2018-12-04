def add_claim!(fabric:, start_x:, start_y:, size_x:, size_y:)
  end_x = start_x + size_x
  end_y = start_y + size_y
  (start_x...end_x).each do |x|
    fabric[x] ||= {}
    (start_y...end_y).each do |y|
      fabric[x][y] = fabric[x][y].nil? ? 1 : fabric[x][y] + 1
    end
  end
end

def overlaps?(fabric:, start_x:, start_y:, size_x:, size_y:)
  end_x = start_x + size_x
  end_y = start_y + size_y
  (start_x...end_x).each do |x|
    (start_y...end_y).each do |y|
      return true if fabric[x][y] > 1
    end
  end
  false
end

def setup_claims!
  fabric = {}
  File.foreach('input') do |input|
    matches = input.match(/#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/)
    start_x = matches[2].to_i
    start_y = matches[3].to_i
    size_x = matches[4].to_i
    size_y = matches[5].to_i
    add_claim! fabric: fabric,
               start_x: start_x,
               start_y: start_y,
               size_x: size_x,
               size_y: size_y
  end
  fabric
end