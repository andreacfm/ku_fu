require "spec_helper"

describe "rspec matchers" do

    it { Document.should register_ku_fu}
    it { Object.should_not register_ku_fu}

end