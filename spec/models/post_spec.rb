require 'rails_helper'

RSpec.describe Post, type: :model do
    let(:post) { build(:post) }

    describe "#author" do
      context "when is nil" do
        let(:post) { build(:post, author: nil) }

        it "is invalid" do
          post.valid?
          expect(post.errors[:author]).to include("can't be blank")
        end
      end
    end

    describe "#title" do
      context "when is nil" do
        let(:post) { build(:post, tiltle: nil) }

        it "is invalid" do
          post.valid?
          expect(post.errors[:title]).to include("can't be blank")
        end
      end
    end

    describe "#title" do
      context "when is nil" do
        let(:post) { build(:post, tiltle: nil) }

        it "is invalid" do
          post.valid?
          expect(post.errors[:title]).to include("can't be blank")
        end
      end
    end
end
