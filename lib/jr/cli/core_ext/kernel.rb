module Kernel
  unless Kernel.respond_to? :itself
    def itself
      self
    end
  end
end
