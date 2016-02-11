class SimplexController < ApplicationController
  def index
  end

  def result
    sa = []
    @tables = []

    simplex_params['sa'].each do |x|
      sa << x[1].map(&:to_f)
    end

    z = simplex_params['z'].map(&:to_f)
    b = simplex_params['b'].map(&:to_f)

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