# -*- encoding : utf-8 -*-

class Phrase::Tool::Commands::Push < Phrase::Tool::Commands::Base
  FORMATS_CONTAINING_LOCALE = %q(po yml qph ts xlf)
  RAILS_DEFAULT_FOLDER = "./config/locales/"

  def initialize(options, args)
    super(options, args)
    require_auth_token!

    @file_names = @args[1..-1]
    @locale = @options.get(:locale)
    @format = @options.get(:format)
    @tags = @options.get(:tags)
    @recursive = @options.get(:recursive)
    @update_translations = @options.get(:update_translations)
    @skip_unverification = @options.get(:skip_unverification)
    @skip_upload_tags = @options.get(:skip_upload_tags)
  end

  def execute!
    unless @tags.empty? or valid_tags_are_given?(@tags)
      print_error "Invalid tags: Only letters, numbers, underscores and dashes are allowed"
      exit_command
    end

    files = choose_files_to_upload(@file_names, @recursive)

    if files.empty?
      print_message "Could not find any files to upload".light_red
      exit_command
    else
       interruptable_upload_files(files)
    end
  end

private
  def interruptable_upload_files(files)
    begin
      Thread.new(files){ upload_files(files) }.join
    rescue SystemExit, Interrupt, Exception
      print_error "Failed"
    end
  end

  def choose_files_to_upload(file_names, recursive=false)
    files = []

    if file_names.empty?
      if rails_default_locale_folder_available?
        file_names = [RAILS_DEFAULT_FOLDER]
        print_message "No file or directory specified, using #{RAILS_DEFAULT_FOLDER}"
      else
        print_error "Need either a file or directory:"
        print_error "phrase push FILE"
        print_error "phrase push DIRECTORY"
        exit_command
      end
    end

    file_names.each do |file_name|
      if File.directory?(file_name)
        pattern = recursive ? "#{File.expand_path(file_name)}/**/*" : "#{File.expand_path(file_name)}/**"
        files += Dir.glob(pattern)
      else
        files << file_name
      end
    end

    files.reject { |file| File.directory?(file) }
  end

  def upload_files(files)
    files.each do |file|
      if file_exists?(file)
        upload_file(file)
      else
        print_error "The file #{file} could not be found."
      end
    end
  end

  def upload_file(file)
    if file_valid?(file)
      begin
        tagged = " (tagged: #{@tags.join(", ")})" if @tags.size > 0
        print_message "Uploading #{file}#{tagged}..."
        unless force_use_of_default_locale?(file)
          locale = detect_locale_name_from_file_path(file)
        else
          locale = Phrase::Tool::Locale.find_default_locale.try(:name)
        end
        locale = @locale if @locale
        api_client.upload(file, file_content(file), @tags, locale, @format, @update_translations, @skip_unverification, @skip_upload_tags)
        print_message "OK".green
      rescue Exception => e
        print_error "Failed"
        print_server_error(e.message)
      end
    else
      print_error "Notice: Could not upload #{file} (type not supported)"
    end
  end

  def file_content(file)
    content = File.open(file).read
    content = utf16_to_utf8(content) if file_seems_to_be_utf16?(file)
    content
  end

  def force_use_of_default_locale?(file_path)
    not Phrase::Formats.file_format_exposes_locale?(file_path)
  end

  def utf16_to_utf8(string)
    string.encode("UTF-8", "UTF-16")
  end

  def file_seems_to_be_utf16?(file)
    Phrase::Tool::EncodingDetector.file_seems_to_be_utf16?(file)
  end

  def file_valid?(filepath)
    extension = filepath.split('.').last
    allowed_file_extensions.include?(extension)
  end

  def file_exists?(file)
    File.exist?(file)
  end

  def valid_tags_are_given?(tags)
    tags.all? { |tag| Phrase::Tool::TagValidator.valid?(tag) }
  end

  def rails_default_locale_folder_available?
    File.exist?(RAILS_DEFAULT_FOLDER) && File.directory?(RAILS_DEFAULT_FOLDER)
  end

  def detect_locale_name_from_file_path(file_path)
    Phrase::Formats.detect_locale_name_from_file_path(file_path)
  end

  def allowed_file_extensions
    extensions = []
    Phrase::Formats::SUPPORTED_FORMATS.each do |format, handler|
      extensions = extensions | handler.send(:extensions)
    end
    extensions.uniq.map(&:to_s)
  end
end
