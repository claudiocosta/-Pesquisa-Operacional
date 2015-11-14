class KnapsackController < ApplicationController
  def index
  end

  def result
    input = knapsack_params
    @max_weight = knapsack_params['input1'].to_i
    w = knapsack_params['w'].map(&:to_i)
    c = knapsack_params['c'].map(&:to_i)

    #@out = Knapsack.new(max_weight, w, c)
    @out = Knapsack.new(23,[1,2,5,6,7,9,11],[1,6,18,22,28,40,60])
    array = @out.result

    @table = array[0]
    @items = array[1]
  end

  private
  def knapsack_params
    params.permit!
  end
end