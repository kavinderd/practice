def lis_length(a):
  n = len(a)
  q = [0] * n
  overall_max = 0

  for i in range(n):
    mx = 0
    for j in range(i):
      if a[i] > a[j]:
        if q[j] > mx:
          mx = q[j]
    q[i] = mx + 1
    overall_max = max(q[i], overall_max)

  print overall_max

a = [2, 8, 1, 3, 10, 6, 7, 8]
lis_length(a)
