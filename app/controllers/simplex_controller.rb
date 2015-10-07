class SimplexController < ApplicationController
  def index
  end

  def result
    @resultado = simplex_params
    @array = []
    @array << @resultado['z'].map(&:to_i)
    @teste = []

    @resultado['sa'].each do |x|
      @teste << x[1].map(&:to_i)
    end

    @array << @teste
    @array << @resultado['b'].map(&:to_i)

  end

  private
  def simplex_params
    params.permit!#(:quantRestricoes, :z, :sa)
  end
end