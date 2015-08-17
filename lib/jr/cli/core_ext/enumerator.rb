class Enumerator
  # Compute size even if it is infinite list
  def size
    reduce(0) { |acc, x| acc += 1 }
  end
end
