# Sample Ruby on Rails application with Phrase integration (DEPRECATED)

![maintenance-status](https://img.shields.io/badge/maintenance-deprecated-red.svg)

> This repository for the demo app of Phrase Strings In-Context Editor with `phraseapp-in-context-editor-ruby` has been deprecated and is no longer maintained. Please refer to the [phraseapp-in-context-editor-ruby](https://github.com/phrase/phraseapp-in-context-editor-ruby) repository, where the demo has been moved to and will be maintained. 
 
<hr />

Simple todo app to show how to use with [Phrase In-Context-Editor](https://phrase.com).

## Installation

Follow these easy steps to install and start the app:

### Set up Rails app

First, install the gems required by the application:

    bundle

Next, execute the database migrations/schema setup:

	bundle exec rake db:setup


### Initialize Phrase

Use the Rails generator to add a `phraseapp_in_context_editor.rb` initializer:

  bundle exec rails generate phraseapp_in_context_editor:install --access-token=<YOUR_ACCESS_TOKEN> --project-id=<YOUR_PROJECT_ID>

If you don't have a [Phrase account](https://app.phrase.com/signup) yet, you can use the [demo account](https://phrase.com/demo/) credentials to get started:

### Start the app

Start the Rails app to see the In-Context-Editor added to the To-Do application. You're ready to localize your app:

    bundle exec rails server

You can find your app now by pointing your browser to [http://localhost:3000](http://localhost:3000). If everything worked you can log into In-Context Editor with your Phrase user account or the demo login credentials:

	User: demo@phrase.com
	Password: phrase

## So, what next?

In-Context-Editor is a great way to start translating your application. All translations you enter will be stored directly in [Translation Center](https://app.phrase.com/account/login), the backend software for all Phrase projects. Log in with your demo credentials to see all possibilities for your new translation management: [Translation Center](https://app.phrase.com/account/login)

Want to know more? Check our [documentation](https://help.phrase.com/help)!

## More information

* [Read the Phrase documentation](https://help.phrase.com/help)
* [Get your free Phrase trial](https://app.phrase.com/signup)
* [Get in touch](https://phrase.com/contact/)

## Get help / support

Please contact [support@phrase.com](mailto:support@phrase.com?subject=[GitHub]%20) and we can take more direct action toward finding a solution.
