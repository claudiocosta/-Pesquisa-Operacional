class SimplexController < ApplicationController
  require 'simplex'
  def index
  end

  def result
    ent = simplex_params
    @array = []
    aux = []
    @tables = []
    @result
    @array << ent['z'].map(&:to_f)

    ent['sa'].each do |x|
      aux << x[1].map(&:to_f)
    end

    @array << aux
    @array << ent['b'].map(&:to_f)

    z = @array[0]
    sa = @array[1]
    b = @array[2]

    @out = Simplex.new(z,sa,b)
    @table = @out.table_s

    until @out.solve.nil?
      @tables << @out.table_s
    end

    @result = @out.table_s(@out.result)
  end

  private
  def simplex_params
    params.permit!
  end
end