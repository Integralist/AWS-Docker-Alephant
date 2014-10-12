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
    end
  end
end

