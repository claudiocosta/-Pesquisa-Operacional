module ApplicationHelper
  def nav_active_btn(btn, path)
    if current_page? path
      content_tag :li, link_to(btn, path), :class => 'active'
    else
      content_tag :li, link_to(btn, path)
    end
  end

  def opt_name(path)
    if path == "/simplex"
      @input1 = "Quantidade de Variáveis: "
      @input2 = "Quantidade de Restrições: "
      @opt = 0
    elsif path == "/knapsack"
      @input1 = "Capacidade Máxima: "
      @input2 = "Quantidade de Itens: "
      @opt = 1
    end
  end
end
