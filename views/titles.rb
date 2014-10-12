class Application
  module Views
    class Titles < Layout
      def title
        "#{super} - Titles"
      end

      def titles
        title_list
      end
    end
  end
end
