class Joke {
  String joke;
  String? punchline;

  Joke({required this.joke, this.punchline});
}

extension Jokes on Joke {
  static List<Joke> haha() {
    return [
      Joke(
        joke: "I'm afraid for the calendar. Its days are numbered.",
      ),
      Joke(
        joke: "I sang in the shower yesterday.",
        punchline: "It was a soap opera",
      ),
      Joke(
          joke: "What do you call a fish wearing a bowtie?",
          punchline: "Sofishticated"),
      Joke(
        joke: "What do you call a factory that makes okay products?",
        punchline: "A satisfactory.",
      ),
      Joke(
        joke: "What did the ocean say to the beach?",
        punchline: "Nothing, it just waved.",
      ),
      Joke(
        joke: "What is wait and super annoying at breakfast?",
        punchline: "An avalanche.",
      ),
      Joke(
        joke: "I only know 25 letters of the alphabet. I don't know y.",
      ),
      Joke(
        joke: "Where do fruits go on vacation?",
        punchline: "Pear-is",
      ),
      Joke(
        joke: "What's the best thing about Switzerland?",
        punchline: "I don't know, but the flag is a big plus.",
      ),
      Joke(
        joke: "I don't trust those trees. They seem kind of shady.",
      ),
      Joke(
        joke: "Why don't eggs tell jokes?",
        punchline: "They'd crack each other up.",
      ),
      Joke(
        joke: "I don't trust stairs. They're always up to something.",
      ),
      Joke(
        joke: "How does a taco say grace?",
        punchline: "Lettuce pray.",
      ),
      Joke(
        joke: "Why did the math book look so sad?",
        punchline: "Because of all of its problems!",
      ),
      Joke(
        joke: "I used to be addicted to soap, but I'm clean now.",
      ),
      Joke(
        joke: "What country's capital is growing the fastest?",
        punchline: "Ireland. Every day it's Dublin.",
      ),
      Joke(
        joke: "I once had a dream I was floating in an ocean of orange soda.",
        punchline: "It was more of a fanta sea.",
      ),
      Joke(
        joke: "Why did the scarecrow win an award?",
        punchline: "Because he was outstanding in his field.",
      ),
      Joke(
        joke: "What do you call an elephant that doesn't matter?",
        punchline: "An irrelephant.",
      ),
      Joke(
        joke:
            "If you see a crime happen at the Apple store, what does it make you?",
        punchline: "An iWitness",
      ),
      Joke(
        joke: "What do you call a fake noodle?",
        punchline: "An impasta.",
      ),
      Joke(
        joke: "What do you call two monkeys that share an Amazon account?",
        punchline: "Prime mates.",
      ),
      Joke(
        joke: "Where do math teachers go on vacation?",
        punchline: "Times Square.",
      ),
      Joke(
        joke: "What's a robot's favorite snack?",
        punchline: "Computer chips",
      ),
      Joke(
        joke: "Mountains aren't just funny. They're hill areas.",
      ),
      Joke(
          joke: "What does Thor wear under his clothes?",
          punchline: "Thunderwear"),
      Joke(joke: "Don't trust atoms. They make up everything!"),
      Joke(
          joke: "How do celebrities stay cool?",
          punchline: "They have many fans."),
    ]..shuffle();
  }
}
