require 'sinatra/base'
require 'net/http'

# nodoc
class App < Sinatra::Base
  get '/' do
    'Hello, world!'
  end

  get '/free' do
    send_photon_message('i_am_free')
  end

  get '/busy' do
    send_photon_message('i_am_working')
  end

  get '/dnd' do
    send_photon_message('do_not_disturb')
  end

  get '/driving' do
    send_photon_message('i_am_driving')
  end

  get '/done' do
    send_photon_message('i_am_done')
  end

  private

  def send_photon_message(message)
    binding.pry
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
