require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QDStuConn
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

def uploadFile(file)
  if !(file.original_filename.empty?)
    @filename = getFileName(file.original_filename)
    File.open("./public/images/#{@filename}", "wb") do |f|
      f.write(file.read)
    end
    return @filename
  end
end

def getFileName(filename)
  if !filename.nil?
    return filename
  end
end
