module SimplexHelper
  def fill_table
    table = @out.solve

    concat content_tag(:tr, table[0].each do |th| concat content_tag(:th, th) end)

    1.upto(table.length - 1) do |i|
      concat content_tag(:tr, table[i].each do |elem| concat content_tag(:td, elem) end)
    end
    #table.each do |line|
    #  concat content_tag(:tr, line.each do |elem| concat content_tag(:td, elem) end)
    #end
  end
end