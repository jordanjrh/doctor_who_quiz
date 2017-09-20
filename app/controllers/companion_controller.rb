class CompanionController < ApplicationController
  def image_questions
    companionResponse = HTTParty.get('http://localhost:3001/api/v1/companions.json')
    @characterArr = []
    companionResponse.each do |companion|
      @characterArr.push({:name => companion["name"], :actor_name => companion["actor_name"], :category => companion["category"], :species => companion["species"], :episodes => companion["episodes"], :doctors => companion["doctors"], :image_url => ("http://localhost:3001/companions/" + companion["image_url"]), :actor_image_url => ("http://localhost:3001/companion_actors/" + companion["actor_image_url"]) })
    end
    quizSelectionArr = (0..(@characterArr.length - 1)).to_a.reject { |item| item.nil? || item == '' }.shuffle.take(3)
    @answer = quizSelectionArr[0]
    @selections = quizSelectionArr.shuffle
  end
end
