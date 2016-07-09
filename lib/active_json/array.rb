module ActiveJson
  class Array < Array
    def to_h
      map do |value|
        STRUCTURES.any? { |s| value.is_a?(s) } ? value.to_h : value
      end
    end
  end
end
