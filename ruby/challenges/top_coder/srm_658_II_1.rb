# SRM 658 Div II Level 1

def infinites_equal(s,t)
  return "Equal" if s == t

  longest_shared_prefix = ""
  i = 0
  j = 0
  while i < s.length && j < t.length
    if s[i] == t[j]
      longest_shared_prefix += s[i]
      i += 1
      j += 1
    else
      break
    end
  end

  return "Not Equal" unless longest_shared_prefix.length > 0
  
  if equalizable?(s, t, longest_shared_prefix)
    "Equal"
  else
    "Not Equal"
  end
end

def equalizable?(s,t, prefix)
  if s.length == t.length
    false
  else
    prefix_index = prefix.length - 1
    longer = s.length > t.length ? s : t
    shorter = s == longer ? t : s
    equalized = false

    prefix_index.downto(1) do |i|
      if shorter + prefix[0..i] == longer
        equalized = true
        break
      end
    end
    equalized
  end
end

s = "ababab"
t = "abab"
p infinites_equal(s,t)

s = "ab"
t = "abab"
p infinites_equal(s, t)

s = "abc"
t = "bca"
p infinites_equal(s, t)
