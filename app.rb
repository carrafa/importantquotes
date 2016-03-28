require 'cuba'
require 'cuba/haml'
require 'cuba/sass'
require 'json'
require './lib/writer.rb'

Cuba.plugin Cuba::Haml
Cuba.plugin Cuba::Sass

Cuba.use(
  Rack::Static,
  urls: %w(/js /stylesheets),
  root: "./public"
)

Cuba.settings[:sass] = {
  style: :compact,
  template_location: "assets/stylesheets"
}

Cuba.define do

  on get do

    on root do
     haml 'index' 
    end

    on "api/sentence/:writer" do |writer|
      words = Writer.new(writer).write_sentence
      res.write words.to_json
    end

    on "api/poem/:writer" do |writer|
      words = Writer.new(writer).write_poem
      res.write words.to_json
    end

  end

end
