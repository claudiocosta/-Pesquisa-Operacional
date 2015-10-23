class Simplex
  # construtor, cria tabela em array
  def initialize(z,sa,b)
    @qtd_var = z.length
    @qtd_sa = sa.length
    @b = b
    x = []
    f = []
    zi = []
    @table = []

    # popula valores de f para tabela
    fmatrix = Array.new(@qtd_sa){Array.new(@qtd_sa, 0)}
    1.upto(@qtd_var) { |n| x << "x" + "#{n}" }
    1.upto(@qtd_sa) { |n| f << "f" + "#{n}" }
    @table << ['linha','base',*x,*f,'b']

    # inverte o sinal das variaveis z
    z.each do |aux|
      zi << aux * -1
    end

    # popula a array table
    #sa.map.with_index do |aux,i|
    0.upto(@qtd_sa - 1) do |i|
      fmatrix[i][i] = 1
      @table << [(i + 1).to_s, f[i], *sa[i], *fmatrix[i], b[i]]
    end
    @table << [@table.length.to_s, 'z', *zi, *Array.new(@qtd_sa + 1, 0)]
  end

  # converte a tabela inteira para string
  def table_s(tb = nil)
    if tb.nil?
      aux = @table.clone
    else
      aux = tb
    end
    l = []
    table_str = []
    aux.each do |line|
      line.each do |e|
        if e.class == String
          l << e
        else
          l << e.round(3).to_s
        end
      end
      table_str << l.clone
      l.clear
    end
    table_str
  end

  def solve
    pivot_col = coef_col
    if coef_col.nil?
      nil
    else
      table_len = (@qtd_sa + @qtd_var + 2)
      menor = 100_000_000
      pivot_row = nil
      1.upto(@qtd_sa) do |i|
        if @table[i][pivot_col] > 0 && @table[i].last.fdiv(@table[i][pivot_col]) < menor
          menor = @table[i].last.fdiv(@table[i][pivot_col])
          pivot_row = i
        end
      end

      # valor do pivô
      piv_val = @table[pivot_row][pivot_col]
      # coloca variavel na base
      @table[pivot_row][1] = @table[0][pivot_col]

      # divide elementos da linha do pivô
      2.upto(table_len) do |i|
        @table[pivot_row][i] = @table[pivot_row][i].fdiv(piv_val)
      end

      # reajusta tabela
      1.upto(@table.length - 1) do |i|
        if @table[i][pivot_col] != 0 && i != pivot_row
          piv_aux = (@table[i][pivot_col] * -1)
          2.upto(table_len) do |j|
            @table[i][j] = ((@table[pivot_row][j] * piv_aux) + @table[i][j])
          end
        end
      end
      @table
    end
  end

  def result
    col_begin = (2 + @qtd_var)
    col_end = (col_begin + @qtd_sa - 1)
    table_aux = []
    table = []

    # calcula análise de sensibilidade para todos elementos
    col_begin.upto(col_end) do |i|
      line = []
      1.upto(@qtd_sa) do |j|
        if @table[j][i] == 0
          line << 0
        else
          line << @table[j].last / (@table[j][i] * -1)
        end
      end
      table_aux << [@table.last[i], *line.minmax]
      line.clear
    end

    # monta tabela organizada para uso na view
    table_aux.each_with_index do |el,i|
      line = []
      line << el[0]
      1.upto(2) do |j|
        aux = el[j] + @b[i]
        if el[j] == 0 or aux < 0
          line << ""
        else
          line << el[j] + @b[i]
        end
      end
      line.insert(0, "R" + (i + 1).to_s)
      line << @b[i]
      table << line.clone
      line.clear
    end
    table
  end

  # busca coluna do coeficiente
  def coef_col
    if @table.last[2..(@qtd_var + 1)].min == 0
      nil
    else
      @table.last.index(@table.last[2..(@qtd_var + 1)].min)
    end
  end

  # retorna se é calculavel
  def can_improve?
    if coef_col.nil?
      false
    else
      true
    end
  end
end