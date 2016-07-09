module ActiveJson
  class Hash < OpenStruct
    def to_h
      super.map do |key, value|
        [
          key,
          STRUCTURES.any? { |s| value.is_a?(s) } ? value.to_h : value
        ]
      end.to_h
    end
  end
end
