class RemovePostJob < ApplicationJob
  queue_as :default

  def perform(post_id)
    post = Post.find_by(id: post_id)

    if post && post.created_at < 10.minutes.ago
      post.destroy
    end
  end
end