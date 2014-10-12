class Application
  module Views
    class Index < Layout
      def title
        "#{super} - Home"
      end

      def content
        "Welcome to the screener request service."
      end

      def stats
        [
          {
            :service => 'titles',
            :count => title_list.count
          },
          {
            :service => 'clients',
            :count => client_list.count
          },
          {
            :service => 'requests',
            :count => request_list.count
          }
        ]
      end

    end
  end
end
