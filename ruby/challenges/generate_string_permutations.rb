def build_permutations(string)
  if string.length <= 1
    [string]
  else
    all_chars_but_last = string[0...-1]
    last_char = string[-1]

    previous_permutations = build_permutations(all_chars_but_last)
    permutations = []

    previous_permutations.each do |perm|
      p perm
      0.upto(perm.length) do |i|
        permutations.push(perm[0...i] + last_char + perm[i..-1])
      end
    end
    permutations
  end
end

string = "cat"
p build_permutations(string)
