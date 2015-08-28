# Sample application with PhraseApp integration

Simple todo app to show how to use with [PhraseApp In-Context-Editor](https://phraseapp.com).

## Installation

Follow these easy steps to install and start the app:

### Set up Rails app

First, install the gems required by the application:

    bundle

Next, execute the database migrations/schema setup:

	bundle exec rake db:setup


### Initialize PhraseApp

Use the Rails generator to add a `phraseapp_in_context_editor.rb` initializer:

  bundle exec rails generate phraseapp_in_context_editor:install --access-token=<YOUR_ACCESS_TOKEN> --project-id=<YOUR_PROJECT_ID>

If you don't have a [PhraseApp account](https://phraseapp.com/en/signup) yet, you can use the [demo account](https://phraseapp.com/demo) credentials to get started:

### Start the app

Start the Rails app to see the In-Context-Editor added to the To-Do application. You're ready to localize your app:

    bundle exec rails server

You can find your app now by pointing your browser to [http://localhost:3000](http://localhost:3000). If everything worked you can log into In-Context Editor with your PhraseApp user account or the demo login credentials:

	User: demo@phraseapp.com
	Password: phrase

## So, what next?

In-Context-Editor is a great way to start translating your application. All translations you enter will be stored directly in [Translation Center](https://phraseapp.com/en/account/login), the backend software for all PhraseApp projects. Log in with your demo credentials to see all possibilities for your new translation management: [Translation Center](https://phraseapp.com/en/account/login)

Want to know more? Check our [documentation](https://phraseapp.com/docs)!

## More information

* [Read the PhraseApp documentation](https://phraseapp.com/docs)
* [Get your free PhraseApp trial](https://phraseapp.com/signup)
* [Get in touch with the engineers](http://support.phraseapp.com/)
