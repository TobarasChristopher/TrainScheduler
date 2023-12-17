class RemovePostJob < ApplicationJob
  queue_as :default
# Example code of deleting a job after 10 minutes of creation
# Test code to see if embedding a timer within a schedule was applicable
  def perform(post_id)
    post = Post.find_by(id: post_id)

    if post && post.created_at < 10.minutes.ago
      post.destroy
    end
  end
end