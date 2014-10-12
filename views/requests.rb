class Application
  module Views
    class Requests < Layout
      def title
        "#{super} - Requests"
      end

      def requests
        options = {
          :table_name => ENV['REQUEST_TABLE_NAME'],
          :limit      => 100
        }
        items = ddb.scan(options)
        items[:member].map do |item|
          {
            :id       => item["id"][:s],
            :title    => item["title"][:s],
            :client   => item["client"][:s]
          }
        end
      end

    end
  end
end
