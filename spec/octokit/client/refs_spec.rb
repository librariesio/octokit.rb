# -*- encoding: utf-8 -*-
require 'helper'

describe Octokit::Client::Refs do

  before do
    @client = Octokit::Client.new(:login => 'sferik')
  end

  describe ".refs" do

    it "should return all refs" do
      stub_get("/repos/sferik/rails_admin/git/refs/").
        to_return(:body => fixture("v3/refs.json"))
      refs = @client.refs("sferik/rails_admin")
      refs.first.ref.should == "refs/heads/actions"
    end

    it "should return all tag refs" do
      stub_get("/repos/sferik/rails_admin/git/refs/tags").
        to_return(:body => fixture("v3/refs_tags.json"))
      refs = @client.refs("sferik/rails_admin","tags")
      refs.first.ref.should == "refs/tags/v0.0.1"
    end

  end

end

