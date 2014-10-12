class Application
  module Views
    class Requests < Layout
      def title
        "#{super} - Requests"
      end

      def requests
        request_list
      end

    end
  end
end
