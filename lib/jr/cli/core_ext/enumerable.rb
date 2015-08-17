module Enumerable
  def unwrap
    Enumerator.new do |yielder|
      each do |element|
        if element.is_a? Hash
          element.each_value do |sub_element|
            yielder.yield sub_element
          end
        else
          element.each do |sub_element|
            yielder.yield sub_element
          end
        end
      end
    end
  end
end
