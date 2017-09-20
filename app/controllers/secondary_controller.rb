class SecondaryController < ApplicationController
  def image_questions
    secondaryResponse = HTTParty.get('http://localhost:3001/api/v1/secondaries.json')
    @characterArr = []
    secondaryResponse.each do |secondary|
      @characterArr.push({:name => secondary["name"], :actor_name => secondary["actor_name"], :category => secondary["category"], :species => secondary["species"], :image_url => ("http://localhost:3001/secondaries/" + secondary["image_url"]) })
    end
    quizSelectionArr = (0...@characterArr.length).to_a.reject { |item| item.nil? || item == '' }.shuffle.take(3)
    @answer = quizSelectionArr[0]
    @selections = quizSelectionArr.shuffle
  end
end
