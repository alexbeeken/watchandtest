class Question < ActiveRecord::Base

  has_many :responses

  def self.create_time_signature_questions
    Question.create(text: "What tells you the meter of a piece?", response_type: "text")
    Question.create(text: "What does the top number of a time signature tell you?", response_type: "text")
    Question.create(text: "What does the bottom number of a time signature tell you?", response_type: "text")
    Question.create(text: "What is the time signature of this example?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_0.jpg")
    Question.create(text: "How many beats per measure with this time signature?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_1.png")
    Question.create(text: "What do you call the time signature on left?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_2.jpg")
    Question.create(text: "How are these two time signatures related?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_2.jpg")
    Question.create(text: "How are these two time signatures related?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_3.jpg")
    Question.create(text: "What’s the difference between cut time and common time?", response_type: "text")
    Question.create(text: "Is this time signature in duple or triple meter?", response_type: "select", choices: JSON.generate(["duple", "triple"]), media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_1.png")
    Question.create(text: "Why do we need time signatures?", response_type: "text", after_only: false)
    Question.create(text: "Did you feel the video’s humor was helpful or distracting?", response_type: "text", after_only: true)
    Question.create(text: "What level of enjoyment did you experience watching this video?", after_only: true, response_type: "select", choices: JSON.generate(["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]))
    Question.create(text: "What are you still unsure on?", response_type: "text", after_only: true)
    Question.create(text: "Are there any other things you noticed that wasn't helpful about the video? (pacing, clarity, repetition, missing steps, etc.)", response_type: "text", after_only: true)
  end

end
