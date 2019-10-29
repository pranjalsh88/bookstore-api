require 'json'
# require 'rubystats'

class GithubWebhooksController < ActionController::Base
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  include GithubWebhook::Processor

  def create
    github_webhook = JSON.parse(params.to_json)["github_webhook"]
    # __Note__ Needs to be done better
    name = github_webhook["issue"]["title"]
    bio = github_webhook["issue"]["body"]
    action = github_webhook["action"]
    deleted_actions = ['closed', 'deleted']
    begin
      case action
      # when an issue is created
      when 'opened'
        puts 'created'
        save_author(name, bio)
        # when an issue is edited
      when 'edited'
        puts 'modified'
        modify_author(name, bio)
        # either of the deleted actions
      when *deleted_actions
        puts 'closed'
        delete_author(name)
      else
        render :json => {"status": "Invalid action: #{action}"}, :status => :bad_request
      end
    rescue Exception => e
      puts "Something went wrong with error #{e.full_message}"
      render :json => {"status": "Something went wrong"}, :status => :internal_server_error
    end

    # If a corresponding author is not found. Should be handling this is in a cleaner way.
    if @author.nil?
      render json: {"status": "Corresponding Author wasn't found"}, status: :bad_request
    else
      render json: {"status": "success"}, status: :ok
    end
  end

  private

  def webhook_secret(payload)
    "a_gr34t_s3cr3t"
  end
  # save author
  def save_author(name, bio)
    # Assuming only one Github issue exist for an author. In actual scenarios, I'll generate an author_id
    @author = Author.where(:name => name).first_or_create(:biography => bio).save
  end

  # update if exists
  def modify_author(name, bio)
    @author = Author.find_by(name: name)
    if @author
      @author.update(name: name, biography: bio)
    end
  end

  # delete author and books dependent on that author
  def delete_author(name)
    @author = Author.find_by(name: name).try(:destroy)

  end

end
