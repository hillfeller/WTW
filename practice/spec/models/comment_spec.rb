require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post){Post.create!(title: "Post title", body: "Post body")}
  let(:comment){Comment.create!(body: "Comment body", post: post)}

  describe "attributes" do
    it "responds to body" do
      expect(comment).to respond_to(:body)
    end
  end
end
