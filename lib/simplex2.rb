class Simplex2 < Simplex
  def formatted_tableau
    if can_improve?
      pivot_column = entering_variable
      pivot_row    = pivot_row(pivot_column)
    else
      pivot_row = nil
    end
    num_cols = @c.size + 1
    c = formatted_values(@c.to_a)
    b = formatted_values(@b.to_a)
    a = @a.to_a.map {|ar| formatted_values(ar.to_a) }
    #x = []
    #f = []
    #1.upto(@c.to_a.length - a.length) { |n| x << "x" + "#{n}" }
    #1.upto(a.length) { |n| f << "f" + "#{n}" }
    #f_row = ['Base',]
    table = []

    a.each_index do |i|
      a[i] << b[i]
      table << a[i]
    end
    table << (c << "0")
  end


  def formatted_values2(array)
    array.map {|c| c.round(3).to_s }
  end
end