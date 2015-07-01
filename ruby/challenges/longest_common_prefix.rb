# LeetCode Longest Common Prefix

def longest_common_prefix(strs)
  return "" if strs.length == 0
  return strs[0] if strs.length == 1
  trie = {}
  max_prefix = ""
  max_prefix_length = 0
  min_length = strs[0].length
  strs.each do |string|
    current_prefix = 0
    node = trie
    min_length = [min_length, string.length].min
    string.chars.each_with_index do |char, i|
      if node[char]
        node = node[char]
      else
        node[char] = {}
        node = node[char]
      end
    end
    node["word"] = true
  end

  return "" if min_length == 0

  node = trie
  while max_prefix.length < min_length && node && node.keys.reject { |key| key == "word" }.count <= 1
    keys = node.keys.reject { |key| key  == "word"}
    max_prefix += keys[0] if keys[0]
    node = node[keys[0]]
  end
  max_prefix
end

strs = ["break", "broke", "breaks", "breakdown"]
strs = ["aa", "a"]
p longest_common_prefix(strs)
