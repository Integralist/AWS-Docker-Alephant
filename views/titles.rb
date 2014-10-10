module App
  module Views
    class Titles < Layout
      def title
        "#{super} - Titles"
      end

      def content
        "Welcome to the screener request service."
      end

      def titles
        options = {
          :table_name => 'titles',
          :limit      => 100
        }
        items = AWS::DynamoDB::Client::V20120810.new.scan(options)
require 'pry'
binding.pry
        items[:member]
      end
    end
  end
end
