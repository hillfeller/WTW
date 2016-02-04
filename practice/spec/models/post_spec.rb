require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post){Post.create!(title: RandomData.random_setnence, RandomData.random_paragraph)}

  it { should have_many(:comments) }
  it { should validate_presence_of (:user)}
    describe "attributes" do
      it "responds to title" do
        expect(post).to respond_to(:title)
      end

      it "responds to body" do
        expect(post).to respond_to(:body)
      end
    end

end
