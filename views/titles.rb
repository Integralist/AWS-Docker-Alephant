class Application
  module Views
    class Titles < Layout
      def title
        "#{super} - Titles"
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
    end
  end
end
