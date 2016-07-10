module ActiveJson
  module Base
    def configure
      @config ||= OpenStruct.new(path: nil, readonly: false)
      yield(@config)
    end

    def method_missing(method_name, *args, &block)
      database.public_send(method_name, *args, &block)
    end

    def respond_to_missing?(method_name, *)
      database.respond_to?(method_name)
    end

    def [](index)
      database.dig(index)
    end

    def reload
      @database = nil

      database
    end

    def save
      raise ActiveJson::ReadOnlyDatabase if @config[:readonly]

      result = JSON.pretty_generate(database.to_h)

      File.open(@config[:path], 'w') do |file|
        file.write(result)
      end

      true
    end

    def inspect
      database.to_h
    end

    private

      def database
        @database ||= begin
          JSON.parse(
            File.read(@config[:path]),
            object_class: ActiveJson::Object,
            array_class: ActiveJson::Array
          )
        rescue JSON::ParserError
          nil
        end
      end
  end
end
