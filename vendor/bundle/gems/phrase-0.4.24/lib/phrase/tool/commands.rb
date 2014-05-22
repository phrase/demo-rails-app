# -*- encoding : utf-8 -*-

module Phrase::Tool::Commands
  def self.possible_commands_with_options
    {
      default: {
        version: false,
        help: false
      },
      init: {
        secret: "",
        default_locale: "en",
        domain: "phrase",
        format: nil,
        locale_filename: nil,
        locale_directory: nil,
        target_directory: nil
      },
      push: {
        tags: [],
        recursive: false,
        locale: nil,
        format: nil,
        update_translations: false,
        skip_unverification: false,
        skip_upload_tags: false
      },
      pull: {
        format: nil,
        target: nil,
        tag: nil,
        updated_since: nil,
        include_empty_translations: nil
      },
      tags: {
        list: true
      }
    }
  end

  def self.possible_commands
    self.possible_commands_with_options.keys
  end
end

require "phrase/tool/commands/base"
require "phrase/tool/commands/init"
require "phrase/tool/commands/push"
require "phrase/tool/commands/pull"
require "phrase/tool/commands/tags"
require "phrase/tool/commands/show_version"
require "phrase/tool/commands/show_help"
