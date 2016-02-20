rails c
Question.create(text: "Why apples?", response_type: "text")
Question.create(text: "How many apples?", response_type: "select", media: "https://s-media-cache-ak0.pinimg.com/236x/63/95/65/639565342e0c5826e86a198b51dff059.jpg", choices: JSON.generate(["ruffles", "great expectations", "dynomite", "greenbay wallops"]))
Question.create(text: "How many bobblyes?", response_type: "select", choices: JSON.generate(["party town", "hoffman", "loooooo", "tacos"]))
