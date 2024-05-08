class PostPolicy <ApplicationPolicy
    attr_reader :user,:post

    def initialize(user,post)
        @user=user
        @post=post
    end

    def create?
        user.admin? || (post.respond_to?(:published) && !post.published)
    end
end