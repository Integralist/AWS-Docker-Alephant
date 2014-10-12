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
        options = {
          :table_name => ENV['CLIENT_TABLE_NAME'],
          :limit      => 100
        }
        items = ddb.scan(options)
        items[:member].map do |item|
          {
            :company  => item["company"][:s],
            :buyer    => item["buyer"][:s],
            :teritory => item["teritory"][:s],
          }
        end
      end
    end
  end
end
