class Application
  module Views
    class RequestsCreate < Layout
      def title
        "#{super} - Requests - Update"
      end

      def request
        options = {
          :table_name => ENV['REQUEST_TABLE_NAME'],
          :HashKeyElement => {
            'S' => @params['id']
          }
        }

        items = ddb.get_item(options)
        item[:item][:s]
      end

      def titles
        options = {
          :table_name => ENV['TITLE_TABLE_NAME'],
          :limit      => 100
        }
        items = AWS::DynamoDB::Client::V20120810.new.scan(options)
        items[:member].map do |item|
          { :title_name => item["name"][:s] }
        end
      end

      def clients
        options = {
          :table_name => ENV['CLIENT_TABLE_NAME'],
          :limit      => 100
        }
        items = AWS::DynamoDB::Client::V20120810.new.scan(options)
        items[:member].map do |item|
          {
            :client_name => item["buyer"][:s],
          }
        end
      end
    end
  end
end
