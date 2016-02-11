class Knapsack
  def initialize(max, w, c)
    @weight = w
    @cost = c
    @max = max
    @qtd_items = c.length - 1
    @items = []
    @matrix = []
    head = Array.new(max + 1, 0)
    @matrix << head
    calc_matrix
  end

  def calc_matrix
    line = []
    0.upto(@qtd_items) do |i|
      0.upto(@max) do |j|
        if @weight[i] > j
          line << @matrix[i][j]
        else
          aux = @cost[i] + @matrix[i][j - @weight[i]]
          if aux > @matrix[i][j]
            line << aux
          else
            line << @matrix[i][j]
          end
        end
      end
      @matrix << line.clone
      line.clear
    end
    solve(@qtd_items, @max)
  end

  def solve(i, j)
    unless i == -1
      p [[i + 1,j],@matrix[i + 1][j], "==", @matrix[i][j]]
      if @matrix[i + 1][j] == @matrix[i][j]
        solve(i - 1, j)
      else
        @items[i] = j
        solve(i - 1, j - @weight[i])
      end
    end
  end

  def result
    [@matrix, @items]
  end
end