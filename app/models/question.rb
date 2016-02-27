class Question < ActiveRecord::Base

  has_many :responses

  def index_count
    @question.id - Question.first.id + 1
  end

  def self.create_time_signature_questions
    # TODO needs more questions about the bottom number in the time signature
    # TODO questions need to be revised to have more multiple choice
    Question.create(text: "What tells you the meter of a piece?", response_type: "select", choices: ["the time signature", "the tempo marking", "the quarter note", "the metric system", "the key signature"].shuffle)
    Question.create(text: "What does the top number of a time signature tell you?", response_type: "select", choices: ["the number of beats per measure", "the number of quarter notes per measure", "the number of half notes per measure", "which note value counts as one beat", "which note value counts as two beats"].shuffle)
    Question.create(text: "What does the bottom number of a time signature tell you?", response_type: "select", choices: ["which note value counts as one beat", "which note value counts as two beats", "the number of quarter notes per measure", "the number of beats per measure", "how long to hold each note"].shuffle)
    Question.create(text: "How many beats per measure with this time signature?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_1.png")
    Question.create(text: "What do you call the time signature on left?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_2.jpg")
    Question.create(text: "How are these two time signatures related?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_2.jpg")
    Question.create(text: "How are these two time signatures related?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_3.jpg")
    Question.create(text: "What’s the difference between cut time and common time?", response_type: "text")
    Question.create(text: "What is the meter of this example?", response_type: "select", choices: JSON.generate(["duple", "triple", "allegro", "eighth note", "4 beats per measure"]), media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_1.png")
    Question.create(text: "How many eighth notes would make up one measure in this example?", response_type: "text", media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/question_media_0.jpg")
    Question.create(text: "Why do we need time signatures?", response_type: "text")
    #survey questions for after viewing the video
    Question.create(text: "Did you feel the video’s humor was helpful or distracting?", response_type: "text", after_only: true)
    Question.create(text: "What level of enjoyment did you experience watching this video?", after_only: true, response_type: "select", choices: JSON.generate(["10", "9", "8", "7", "6", "5", "4", "3", "2", "1"]))
    Question.create(text: "What are you still unsure on?", response_type: "text", after_only: true)
    Question.create(text: "Are there any other things you noticed that weren't helpful about the video? (pacing, clarity, repetition, missing steps, etc.)", response_type: "text", after_only: true)
  end

  def self.create_beat_and_durations_questions
    Question.create(text: "What is the beat in music most similar to?", response_type: "select", choices: ["your pulse", "your shoe size", "your hair color", "your lung capacity"].shuffle, correct_answer: "you pulse")
    Question.create(text: "What is the tempo in music?", response_type: "select", choices: ["the speed", "the volume", "the mood", "the historical period", "the composer"].shuffle, correct_answer: "the speed")
    Question.create(text: "What does increasing the tempo do to a song?", response_type: "select", choices: ["makes it shorter", "makes it longer", "makes it easier to perform", "makes it sadder", "makes it calmer"].shuffle, correct_answer: "makes it shorter")
    Question.create(text: "What is the rhythmic value of a note?", response_type: "select", choices: ["how many beats you play it for", "how creative it's rhythm is", "how many quarter notes it's worth", "the time it takes to finish the song", "the way that you play the note"].shuffle, correct_answer: "how many beats you play it for")
    Question.create(text: "What defines the number of beats a whole note is worth?", response_type: "select", choices: ["Time Signature", "Whole Note", "Quarter Note", "Tempo", "Beat"].shuffle, correct_answer: "Time Signature")
    Question.create(text: "If a whole note is worth 4 beats, how many beats is this note worth?", response_type: "select", choices: ["0.25", "0.5", "1", "2", "4"], media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/duration_media_1.png", correct_answer: "4")
    Question.create(text: "If a whole note is worth 4 beats, how many beats is this note worth?", response_type: "select", choices: ["0.25", "0.5", "1", "1.5", "2", "3", "3.5", "4"], media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/duration_media_2.png", correct_answer: "1")
    Question.create(text: "If a whole note is worth 4 beats, how many beats is this note worth?", response_type: "select", choices: ["0.25", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4"], media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/duration_media_3.png", correct_answer: "2")
    Question.create(text: "If a whole note is worth 4 beats, how many beats is this note worth?", response_type: "select", choices: ["0.25", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4"], media: "https://s3-us-west-2.amazonaws.com/videoassessmentsurvey/duration_media_4.png", correct_answer: "0.5")
    #survey questions for after viewing the video
    afters = [
      Question.create(text: "Did you feel the video’s humor was helpful or distracting?", response_type: "text", after_only: true),
      Question.create(text: "What level of enjoyment did you experience watching this video?", after_only: true, response_type: "select", choices: JSON.generate(["10", "9", "8", "7", "6", "5", "4", "3", "2", "1"])),
      Question.create(text: "What are you still unsure on?", response_type: "text", after_only: true),
      Question.create(text: "Are there any other things you noticed that weren't helpful about the video? (pacing, clarity, repetition, missing steps, etc.)", response_type: "text", after_only: true),
      Question.create(text: "Is this something you would give as homework for your students? Please explain.", response_type: "text", after_only: true),
      Question.create(text: "Is this something you would play in the classroom? Please explain.", response_type: "text", after_only: true),
    ]

    afters.each do |question|
      question.after_only = true
      question.save
    end
  end

  def self.delete_all
    Question.delete(Question.all)
  end

end
