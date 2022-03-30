module Api
  module V1
    class UserSerializer
      def self.call(object)
        {
          id: object.id,
          name: object.name,
          username: object.username,
        }
      end
    end
  end
end
