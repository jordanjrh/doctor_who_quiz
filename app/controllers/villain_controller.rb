class VillainController < ApplicationController
  def image_questions

    villainResponse = HTTParty.get('http://localhost:3001/api/v1/villains.json')
    @characterArr = []
    villainResponse.each do |villain|
      if villain["image_url"]
        @characterArr.push({:name => villain["name"], :actor_name => villain["actor_name"], :category => villain["category"], :species => villain["species"], :image_url => villain["image_url"] ? ("http://localhost:3001/villains/" + villain["image_url"]) : "" })
      end
    end
    quizSelectionArr = (0...@characterArr.length).to_a.reject { |item| item.nil? || item == '' }.shuffle.take(3)
    @answer = quizSelectionArr[0]
    @selections = quizSelectionArr.shuffle

  end
end
