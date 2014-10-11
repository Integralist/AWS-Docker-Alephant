class Application
  module Views
    class RequestsCreate < Layout
      def title
        "#{super} - Requests - Update"
      end

      def request
        options = {
          :table_name => 'request',
          :HashKeyElement => {
            'S' => @params['id']
          }
        }

        items = AWS::DynamoDB::Client::V20120810.new.get_item(options)
        item[:item][:s]
      end

      def titles
        options = {
          :table_name => 'title',
          :limit      => 100
        }
        items = AWS::DynamoDB::Client::V20120810.new.scan(options)
        items[:member].map do |item|
          { :title_name => item["name"][:s] }
        end
      end

      def clients
        options = {
          :table_name => 'client',
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
