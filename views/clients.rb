class Application
  module Views
    class Clients < Layout
      def title
        "#{super} - Clients"
      end

      def content
        "Welcome to the screener request service."
      end

      def clients
        client_list
      end
    end
  end
end
