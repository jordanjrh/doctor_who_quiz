class StaticController < ApplicationController
  def quiz
    episodeResponse = HTTParty.get('http://localhost:3001/api/v1/episodes.json')
    doctorResponse = HTTParty.get('http://localhost:3001/api/v1/doctors.json')
    companionResponse = HTTParty.get('http://localhost:3001/api/v1/companions.json')
    secondaryResponse = HTTParty.get('http://localhost:3001/api/v1/secondaries.json')
    villainResponse = HTTParty.get('http://localhost:3001/api/v1/villains.json')
    planetResponse = HTTParty.get('http://localhost:3001/api/v1/planets.json')
    catchphraseResponse = HTTParty.get('http://localhost:3001/api/v1/catchphrases.json')
    itemResponse = HTTParty.get('http://localhost:3001/api/v1/items.json')
    spinoffResponse = HTTParty.get('http://localhost:3001/api/v1/spinoffs.json')

    @episodeArr = []
    @doctorArr = []
    @companionArr = []
    @secondaryArr = []
    @villainArr = []
    @planetArr = []
    @catchphraseArr = []
    @itemArr = []
    @spinoffArr = []

    episodeResponse.each do |episode|
      @episodeArr.push({:story_id => episode["story_id"], :name => episode["name"], :series => episode["series_num"], :air_date => episode["air_date"], :director => episode["director"], :writer => episode["writer"], :companions => episode["companions"], :doctor => episode["doctor"]})
    end
    doctorResponse.each do |doctor|
      @doctorArr.push({:name => doctor["name"], :actor_name => doctor["actor_name"], :species => doctor["species"], :episodes => doctor["episodes"], :species => doctor["companions"], :image_url => ("http://localhost:3001/doctors/" + doctor["image_url"]), :actor_image_url => ("http://localhost:3001/doctor_actors/" + doctor["actor_image_url"]) })
    end
    companionResponse.each do |companion|
      @companionArr.push({:name => companion["name"], :actor_name => companion["actor_name"], :species => companion["species"], :episodes => companion["episodes"], :species => companion["doctors"], :category => companion["category"], :image_url => ("http://localhost:3001/companions/" + companion["image_url"]), :actor_image_url => ("http://localhost:3001/companion_actors/" + companion["actor_image_url"]) })
    end
    secondaryResponse.each do |secondary|
      @secondaryArr.push({:name => secondary["name"], :actor_name => secondary["actor_name"], :species => secondary["species"], :category => secondary["category"], :image_url => ("http://localhost:3001/secondaries/" + secondary["image_url"]) })
    end
    villainResponse.each do |villain|
      @villainArr.push({:name => villain["name"], :actor_name => villain["actor_name"], :species => villain["species"], :category => villain["category"], :image_url => villain["image_url"] ? ("http://localhost:3001/villains/" + villain["image_url"]) : "" })
    end
    planetResponse.each do |planet|
      @planetArr.push({:name => planet["name"] })
    end


    # catchphraseResponse.each do |catchphrase|
    #   @catchphraseArr.push({:story_id => episode["story_id"], :name => episode["name"], :series => episode["series_num"], :air_date => episode["air_date"], :director => episode["director"], :writer => episode["writer"], :companions => episode["companions"], :doctor => episode["doctor"]})
    # end
    # itemResponse.each do |item|
    #   @itemArr.push({:story_id => episode["story_id"], :name => episode["name"], :series => episode["series_num"], :air_date => episode["air_date"], :director => episode["director"], :writer => episode["writer"], :companions => episode["companions"], :doctor => episode["doctor"]})
    # end
    # spinoffResponse.each do |spinoff|
    #   @spinoffArr.push({:story_id => episode["story_id"], :name => episode["name"], :series => episode["series_num"], :air_date => episode["air_date"], :director => episode["director"], :writer => episode["writer"], :companions => episode["companions"], :doctor => episode["doctor"]})
    # end

  end
end
