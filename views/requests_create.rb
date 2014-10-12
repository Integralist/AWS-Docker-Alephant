class Application
  module Views
    class RequestsCreate < Layout
      def title
        "#{super} - Requests - Create"
      end

      def titles
        options = {
          :table_name => ENV['TITLE_TABLE_NAME'],
          :limit      => 100
        }
        items = ddb.scan(options)
        items[:member].map do |item|
          { :title_name => item["name"][:s] }
        end
      end

      def clients
        options = {
          :table_name => ENV['CLIENT_TABLE_NAME'],
          :limit      => 100
        }
        items = ddb.scan(options)
        items[:member].map do |item|
          {
            :client_name => item["buyer"][:s],
          }
        end
      end
    end
  end
end
