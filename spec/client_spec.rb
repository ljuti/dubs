# frozen_string_literal: true

require "spec_helper"

RSpec.describe Dubs::Client do
  let(:client) { described_class.new }

  describe "#workspaces" do
    it "returns a list of workspaces" do
      VCR.use_cassette("workspaces", record: :new_episodes) do
        response = client.workspaces
        expect(response).to be_truthy
        puts response
      end
    end
  end

  describe "#links" do
    let(:workspace_id) { "ws_clwswa0oz0009js203e32gn7r" }

    it "returns a list of links" do
      VCR.use_cassette("links", record: :new_episodes) do
        response = client.links(workspace_id)
        expect(response).to be_truthy
        puts response
      end
    end
  end

  describe "#create_link" do
    let(:workspace_id) { "ws_clwswa0oz0009js203e32gn7r" }
    let(:domain) { "finit.ec" }

    it "creates a link" do
      VCR.use_cassette("create_link", record: :new_episodes) do
        url = "https://www.finitec.fi"
        response = client.create_link(workspace_id, domain, url)
        expect(response).to be_truthy
        puts response
      end
    end

    it "creates a link with a key" do
      VCR.use_cassette("create_link_with_key", record: :new_episodes) do
        url = "https://www.finitec.fi"
        key = "custom/key"
        response = client.create_link(workspace_id, domain, url, key: key)
        expect(response).to be_truthy
        puts response
      end
    end
  end

  describe "#delete_link" do
    let(:workspace_id) { "ws_clwswa0oz0009js203e32gn7r" }
    let(:domain) { "finit.ec" }

    it "deletes a link" do
      VCR.use_cassette("delete_link", record: :new_episodes) do
        url = "https://www.finitec.fi"
        response = client.create_link(workspace_id, domain, url)
        expect(response).to be_truthy
        link_id = response["id"]
        response = client.delete_link(workspace_id, link_id)
        expect(response).to be_truthy
        puts response
      end
    end
  end
end