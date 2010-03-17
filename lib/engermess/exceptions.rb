module Engermess
  module Exceptions

    class Forbidden < Exception
    end

    def forbid! message="Forbidden"
      raise Forbidden, message
    end
  end
end
