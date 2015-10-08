require_relative 'simplex'

out = Simplex.new([3.0, 5.0], [[1.0, 0.0], [0.0, 1.0], [3.0, 2.0]], [4.0, 6.0, 18.0])

out.solve
p 'teste'