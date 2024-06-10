# frozen_string_literal: true

module Dubs
  class Client
    def initialize(config = Dubs.config)
      @config = config
    end

    def workspaces
      connection.get("/workspaces").body
    end

    def links(workspace_id)
      connection.get("/links", workspaceId: workspace_id).body
    end

    def create_link(workspace_id, domain, url, key: nil)
      connection.post("/links", link_params(domain, url, key)) do |request|
        request.params = { workspaceId: workspace_id }
      end.body
    end

    def delete_link(workspace_id, link_id)
      connection.delete("/links/#{link_id}") do |request|
        request.params = { workspaceId: workspace_id }
      end.body
    end

    def connection
      @connection ||= Faraday.new(url: @config.base_url) do |faraday|
        faraday.request :authorization, :Bearer, @config.api_key
        faraday.request :json
        faraday.response :json, content_type: /\bjson$/
        faraday.adapter Faraday.default_adapter
      end
    end

    def link_params(domain, url, key)
      params = { domain: domain, url: url }
      params[:key] = key if key
      params
    end
  end
end