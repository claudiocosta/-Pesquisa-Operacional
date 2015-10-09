require_relative 'simplex'

out = Simplex.new([3.0, 5.0], [[1.0, 0.0], [0.0, 1.0], [3.0, 2.0]], [4.0, 6.0, 18.0])
#out = Simplex.new([11.0,12.0], [[1, 4], [5.0, 2.0]], [10000.0, 30000.0])

=begin
out.table_s.each do |e|
  p e
end
p '------------------------'
until out.solve.nil?
  p '------------------------'
  out.table_s.each do |e|
    p e
  end
=end

#out.table_s.each_with_index do |a,b|
#  p [a,b]
#end
tables = []
until out.solve.nil?
  tables << out.table_s
end

tables.each do |tb|
  tb.each do |line|
    p line
  end
  p '------------------------'
end



1.upto(0) do |i|
  p i
end
#p out.solve
#out.test
p 'teste'
