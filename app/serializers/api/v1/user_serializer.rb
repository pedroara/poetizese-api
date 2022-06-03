module Api
  module V1
    class UserSerializer
      def self.call(object)
        {
          id: object.id,
          name: object.username,
          username: object.username,
          email: object.email,
        }
      end
    end
  end
end
