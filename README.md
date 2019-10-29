# README
###Problem Statement:

As owners of this bookstore, we want any of our staff to be able to edit the biographies (bios) of our authors. However 
most of our staff are not developers, so we’d like to make this possible without coding for each change.
In this hypothetical world, GitHub is the only service our staff have access to. Our goal is to build an integration 
with GitHub to allow staff to manage author bios via GitHub issues.
Here’s how it should work:
• Create an issue in GitHub -> Creates a new author with one book. The author’s name should match the title of the issue,
 and their bio should match the description.
• Update an issue -> Updates the author’s bio with the issue description
• Delete an issue -> Deletes the author and their books
GitHub issue mapping to authors:
• GitHub issue title = Author name
• GitHub issue description = Author bio
Frontend changes:
The biography that’s currently hard coded in Ember should be sourced from a new attribute on the author model
 called biography.
 
 
 ### Approach
 1. The Rake task(init_data:new_init_data) that initializes the data in the DB (in a bit of a dirty manner currently) 
    using oktokit client .
 2. The Rake task to connect with the Github webhooks. github:webhook
 3. ngrok exposes my local host to the internet 
 4. Added 'biography' to the author models
 5. Written a webhook_controller to handle the issue events and make appropriate DB changes.
 
 
 ### Steps
 
 1. Get Github access_token for the account. (I'll provide that. Can't be checked in since Github invalidates it)
 2. Add the token to the method in config/key.rb
 3. Run the rake task using 'rake init_data:new_init_data'. This should create the issues for authors.
 4. ngrok server setup:
    a. Download https://ngrok.com/download and install
    b. Run using ./ngrok http 3000
    c. copy the {URL}
 5. In the repository pranjalsh88/bookstore-api
    a. Go to Settings, choose option 'Webhooks'
    b. Add the following URL '{URL}/github_webhooks'
    c. Add secret: 'a_gr34t_s3cr3t'
    d. Select the 'issues' checkbox permission in the 'Let me select individual events'
 6. Run the rake task using: 'rake github:webhook'
 7. Run the backend using rails/server
 8. Try to create a new issue in the repo 'pranjalsh88/bookstore-api'
 