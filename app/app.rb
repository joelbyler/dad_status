require 'sinatra/base'
require 'net/http'
require 'dotenv'

# nodoc
class App < Sinatra::Base

  def initialize
    super
    Dotenv.load
  end

  get '/' do
    send_file File.expand_path('index.html', settings.public_folder)
  end

  get '/update/:status' do |status|
    send_photon_message(status)
  end

  private

  def send_photon_message(message)
    Net::HTTP.get(uri_for_photon(message))
  end

  def admin_token
    ENV['ADMIN_TOKEN'] || 'letmein'
  end

  def uri_for_photon(message)
    URI("https://maker.ifttt.com/trigger/#{message}/with/key/#{maker_token}")
  end

  def maker_token
    ENV['MAKER_TOKEN']
  end
end
