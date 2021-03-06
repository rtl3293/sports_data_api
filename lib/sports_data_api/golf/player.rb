module SportsDataApi
  module Golf
    class Player < SportsDataApi::JsonData
      def course
        @course ||= Course.new(player[:course]) if player[:course]
      end

      def scores
        @scores ||= player.fetch(:scores, []).map do |json|
          Score.new(json)
        end
      end

      def rounds
        @rounds ||= player.fetch(:rounds, []).map do |json|
          Round.new(json)
        end
      end
    end
  end
end
