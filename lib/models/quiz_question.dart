class QuizQuestion {
  const QuizQuestion(this.headline, this.options);

  final String headline;
  final List<String> options;

  List<String> get shuffledOptions {
    final List<String> shuffledOptions = List.of(options);

    shuffledOptions.shuffle();

    return shuffledOptions;
  }
}
