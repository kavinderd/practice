def lcs(x, y):
  """This function returns length of longest common sequence"""

  n = len(x)
  m = len(y)

  table = dict()

  for i in range(n+1):
    for j in range(m+1):
      if i == 0 or j == 0:
        table[i,j] = 0
      elif x[i-1] == y[j-1]:
        table[i,j] = table[i-1, j-1] + 1
      else:
        table[i,j] = max(table[i-1, j], table[i, j-1])

  return table[n,m]


x = "thisisalongstring"
y = "alongtheroad"

print lcs(x, y)



