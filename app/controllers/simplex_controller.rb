class SimplexController < ApplicationController

  def index
  end

  def result
    ent = simplex_params
    @array = []
    aux = []
    @array << ent['z'].map(&:to_f)


    ent['sa'].each do |x|
      aux << x[1].map(&:to_f)
    end

    @array << aux
    @array << ent['b'].map(&:to_f)

  end

  private
  def simplex_params
    params.permit!#(:quantRestricoes, :z, :sa)
  end
end