class Application
  module Views
    class Layout < Mustache
      def title
        "Screener Requests"
      end

      protected

      def ddb
        @@ddb ||= AWS::DynamoDB::Client::V20120810.new
      end

      def client_list
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

      def title_list
        options = {
          :table_name => ENV['TITLE_TABLE_NAME'],
          :limit      => 100
        }
        items = ddb.scan(options)
        items[:member].map do |item|
          { :title_name => item["name"][:s] }
        end
      end

      def request_list
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

