require "spec_helper"

describe "ku_fu" do

  it "should verify that User.current is not nil" do
    User.current.should_not be_nil
  end

  context "given a class that register_ku_fu" do

    before  do
      @subject = Document
    end

    context "when creating" do

      it "should save the User.current id as creator_id" do
        model = @subject.create!
        model.creator_id.should_not be_nil
        model.creator_id.should eq User.current.id
      end

    end

    context "when updating" do

      it "should save the User.current id as creator_id" do
        model = @subject.create!
        new_user = User.create!
        User.current = new_user
        model.save!
        model.updater_id.should eq User.current.id
        model.creator_id.should_not eq model.updater_id
      end

    end

  end

end