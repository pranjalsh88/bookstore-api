require 'octokit'
include Key

namespace :github do
  desc "TODO"
  task webhook: :environment do
    require "octokit"
    client = Octokit::Client.new(:access_token => Key::access_token)

    repo = "pranjalsh88/bookstore-api"
    callback_url = "http://07f09e1d.ngrok.io/github_webhooks"
    webhook_secret = "a_gr34t_s3cr3t"

    # Create the WebHook
    client.subscribe "https://github.com/#{repo}/events/issues/push.json", callback_url, webhook_secret
  end



end

