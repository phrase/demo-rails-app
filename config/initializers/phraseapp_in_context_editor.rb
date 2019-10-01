PhraseApp::InContextEditor.configure do |config|
  # Enable or disable the In-Context-Editor in general
  config.enabled = true

  # Fetch your project id after creating your first project
  # in Translation Center.
  # You can find the project id in your project settings
  # page (https://phrase.com/projects)
  config.project_id = "00000000000000004158e0858d2fa45c"

  # You can create and manage access tokens in your profile settings
  # in Translation Center or via the Authorizations API
  # (http://docs.phrase.com/api/v2/authorizations/).
  config.access_token = "0000000000000000a45c4158e0858dd1"

  # Configure an array of key names that should not be handled
  # by the In-Context-Editor.
  config.ignored_keys = ["number.*", "breadcrumb.*"]

  # Phrase uses decorators to generate a unique identification key
  # in context of your document. However, this might result in conflicts
  # with other libraries (e.g. client-side template engines) that use a similar syntax.
  # If you encounter this problem, you might want to change this decorator pattern.
  # More information: https://help.phrase.com/phraseapp-for-developers/how-to-setup-and-configure-the-phraseapp-in-context-editor-ice/configure-in-context-editor
  # config.prefix = "{{__"
  # config.suffix = "__}}"
end
