module Phrase::ViewHelpers
  def phrase_javascript(auth_token=nil)
    return "" unless Phrase.enabled?

    auth_token ||= Phrase.auth_token
    js =
%{<script>
  //<![CDATA[
    var phrase_auth_token = '#{auth_token}';
    (function() {
      var phraseapp = document.createElement('script'); phraseapp.type = 'text/javascript'; phraseapp.async = true;
      phraseapp.src = ['#{Phrase.js_use_ssl ? 'https' : 'http'}://', '#{Phrase.js_host}/assets/phrase/#{Phrase.client_version}/app.js?', new Date().getTime()].join('');
      var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(phraseapp, s);
    })();
  //]]>
</script>}
    js.respond_to?(:html_safe) ? js.html_safe : js
  end
end
