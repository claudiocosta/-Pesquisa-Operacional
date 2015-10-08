class Simplex


  def initialize(z,sa,b)
    @qtd_var = z.length
    @qtd_sa = sa.length
    x = []
    f = []
    zi = []
    @table = []
    fmatrix = Array.new(@qtd_sa){Array.new(@qtd_sa, 0)}
    1.upto(@qtd_var) { |n| x << "x" + "#{n}" }
    1.upto(@qtd_sa) { |n| f << "f" + "#{n}" }
    @table << ['linha','base',*x,*f,'b']

    # inverte as variaveis
    z.each do |aux|
      zi << aux * -1
    end

    # popula a array table
    sa.map.with_index do |aux,i|
      fmatrix[i][i] = 1
      @table << [i + 1, f[i], *sa[i], *fmatrix[i], b[i]]
    end
    @table << [@table.length + 1, 'z', *zi, *Array.new(@qtd_sa + 1, 0)]
  end

  def test
    p @table
  end

  def solve
    coef = @table.last.index(@table.last[2..(@qtd_var + 1)].min)
    menor = 100_000
    pivot = nil
    1.upto(@qtd_sa) do |i|
      if @table[i][coef] > 0 && (@table[i].last / @table[i][coef]) < menor
        menor = (@table[i].last / @table[i][coef])
        pivot = i
      end
    end

    @table[pivot][1] = @table[0][coef]

    2.upto(@qtd_sa + @qtd_var + 2) do |i|
      @table[pivot][i] = (@table[pivot][i] / @table[pivot][coef])
    end

    pivot += 1
    pivot.upto(@table.length - 1) do |i|
      2.upto(@qtd_sa + @qtd_var + 2) do |j|
        @table[i][j] = ((@table[i - 1][j] * (@table[i + 1][coef] * -1)) + @table[i][j])
        #p [@table[i - 1][j] , (@table[i + 1][coef] * -1) , @table[i][j]]
        #p [[i,j], @table[i - 1 ][j]]
      end

    end

    p @table


  end

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