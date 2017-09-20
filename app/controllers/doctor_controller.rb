class DoctorController < ApplicationController
  def image_questions
    doctorResponse = HTTParty.get('http://localhost:3001/api/v1/doctors.json')
    @characterArr = []
    doctorResponse.each do |doctor|
      @characterArr.push({:name => doctor["name"], :actor_name => doctor["actor_name"], :category => doctor["category"], :species => doctor["species"], :episodes => doctor["episodes"], :companions => doctor["companions"], :image_url => ("http://localhost:3001/doctors/" + doctor["image_url"]), :actor_image_url => ("http://localhost:3001/doctor_actors/" + doctor["actor_image_url"]) })
    end
    quizSelectionArr = (0...@characterArr.length).to_a.reject { |item| item.nil? || item == '' }.shuffle.take(3)
    @answer = quizSelectionArr[0]
    @selections = quizSelectionArr.shuffle
  end
end
