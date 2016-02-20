namespace :test do
  task :questions => :environment do
    Question.create(text: "Example Question 1");
    Question.create(text: "Example Question 2");
    Question.create(text: "Example Question 3");
    Question.create(text: "Example Question 4");
    Question.create(text: "Example Question 5");
    Question.create(text: "Example Question 6");
    Question.create(text: "Example Question 7");
    Question.create(text: "Example Question 8");
    Question.create(text: "Example Question 9");
    Question.create(text: "Example Question 10");
  end
end
