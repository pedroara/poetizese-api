module Api
  module V1
    class PostSerializer
      def self.call(object)
          {
            id: object.id,
            title: object.title,
            content: object.content,
            author: User.where(id: object.user_id).first.present? ? Api::V1::UserSerializer.call(User.find(object.user_id)) : "Não identificado",
            categoryId: object.category_id
          }
      end
    end
  end
end
