class KnapsackController < ApplicationController
  def index
  end

  def result
    @max_weight = knapsack_params['input1'].to_i
    @w = knapsack_params['w'].map(&:to_i)
    @c = knapsack_params['c'].map(&:to_i)
    @str = ["Peso", "Valor"]

    @out = Knapsack.new(@max_weight, @w, @c)
    array = @out.result

    @table = array[0]
    @items = array[1]
  end

  private
  def knapsack_params
    params.permit!
  end
end