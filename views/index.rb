class Application
  module Views
    class Index < Layout
      def title
        "#{super} - Home"
      end

      def content
        "Welcome to the screener request service."
      end

    end
  end
end
