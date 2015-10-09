class SimplexController < ApplicationController
  require 'simplex'
  def index
  end

  def result
    ent = simplex_params
    @array = []
    aux = []
    @tables = []
    @array << ent['z'].map(&:to_f)

    ent['sa'].each do |x|
      aux << x[1].map(&:to_f)
    end

    @array << aux
    @array << ent['b'].map(&:to_f)

    z = @array[0]
    sa = @array[1]
    b = @array[2]
    #[[3,5], [[1,0], [0,2], [3,2]], [4,6,18]]
    #[3.0, 5.0], [[1.0, 0.0], [0.0, 1.0], [3.0, 2.0]], [4.0, 6.0, 18.0]
    @out = Simplex.new([3.0, 5.0], [[1.0, 0.0], [0.0, 1.0], [3.0, 2.0]], [4.0, 6.0, 18.0])

    #@out = Simplex.new(z,sa,b)
    @table = @out.table_s

    until @out.solve.nil?
      @tables << @out.table_s
    end

  end

  private
  def simplex_params
    params.permit!
  end
end