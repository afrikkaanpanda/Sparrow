require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "#username" do
    context "when is nil" do
      let(:user) { build(:user, username: nil) }

      it "is invalid" do
        user.valid?
        expect(user.errors[:username]).to include("can't be blank")
      end
    end
  end

  context "when NOT unique" do
    let(:original_user) { create(:user) }
    let(:user) { build(:user, username: original_user.username) }

    it "is invalid" do
      user.valid?
      expect(user.errors[:username]).to include("has already been taken")
    end
  end  

  describe "#email" do
    context "when is nil" do
      let(:user) { build(:user, email: nil) }

      it "is invalid" do
        user.valid?
        expect(user.errors[:username]).to include("can't be blank")
      end
    end
  end

  context "when length over 255 characters" do
    let(:user) { build(:user, email: "alando.willo@example.com") }

    it "is invalid" do
      user.valid?
      expect(user.errors[:email]).to include("is too long (maximum is 255 characters)")
    end
  end

  describe "format" do
    context "when @ sign is missing" do
      it "is invalid" do
        user.email = "foobar"
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end
    end
  end

  context "when there a space in the string" do
    it "is invalid" do
      user.email = "foobar @bar.com"
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end
  end


  context "when email is not unique" do
    let(:original_user) { create(:user) }
   let(:user) { build(:user, email: original_user.email) }

    it "is invalid" do
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end

  describe "#password" do
    context "when is nil" do
      let(:user) { build(:user, password: nil) }

    it "is invalid" do
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
      end
    end
  end

  describe "length" do
    before { user.valid? }

    context "when it is too long" do
      let(:user) { build(:user, password: "Password") }
      it { expect(user.errors[:password]).to include("is too long (maximum is 24 characters)") }
    end

    context "when it is too short" do
      let(:user) { build(:user, password: "Password") }

      it { expect(user.errors[:password]).to include("is too short (minimum is 8 characters)") }
    end
  end

  describe "#password_confirmation" do
    context "when nil" do
      let(:user) { build(:user, password_confirmation: nil) }

      it "is invalid" do
        user.valid?
        expect(user.errors[:password_confirmation]).to include("can't be blank")
      end
    end

    context "when it does not match the password" do
      let(:user) { build(:user, password_confirmation: "foobarbaz") }

      it "is invalid" do
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end

end
