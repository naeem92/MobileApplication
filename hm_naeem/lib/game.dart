

class Game {
  String? secretWord;
  String? displayWord;
  List<String> wordList = [];
  List<String> displayWordList = [];
  List<String> wrongLettersGuessed = [];

  Game({required int wordLength}) {
    secretWord = _getRandomWord(wordLength);
    displayWord = _initializeDisplayWord();
  }

  String _getRandomWord(int wordLength) {
    List<String> words = [
      "APPLE",
      "EXQUISITE",
      "CARROT",
      "DURIAN",
      "EGGPLANT",
      "PAY",
      "PEN",
      "ROOF",
      "SKY",
      "BLUE",
      "RED",
      "GRAPE",
      "HONEYDEW",
      "JACKFRUIT",
      "KIWI",
      "LEMON",
      "MANGO",
      "NECTARINE",
      "ORANGE",
      "PAPAYA",
      "QUEEN",
      "JANUARY",
      "FEBRUARY",
      "MARCH",
      "APRIL",
      "MAY",
      "JUNE",
      "JULY",
      "AUGUST",
      "SEPTEMBER",

      "NOVEMBER",
      "DECEMBER",
      "BUY",
      "MOBILE",
      "FAN",
      "DOOR",
      "LOCK",
      "BEAUTIFUL",
      "WATERMELON",
      "PLUMBER",
      "ACCESSIBLE",
      "CELEBRATED",
      "COURAGEOUS",
      "ENCHANTING",
      "IMPRESSIVE",
      "HARMONIOUS",
      "AND",
      "THE",
      "BIG",
      "CAT",
      "DOG",
      "SUN",
      "FUN",
      "JOY",
      "TOP",
      "LOVE",
      "FIRE",
      "WIND",
      "RAIN",
      "PAIN",
      "HOPE",
      "TIME",
      "WAVE",
      "MIND",
      "STORM",
      "DREAM",
      "SMILE",
      "MUSIC",
      "LIGHT",
      "BRIGHT",
      "SHINE",
      "SPIRIT",
      "VICTOR",
      "GROWTH",
      "JOYFUL",
      "HUMBLE",
      "EXPLORE",
      "SERENIT",
      "GLORIFY",
      "EMPOWER",
      "TRIUMPH",
      "BLESSED",
      "EFFORTS",
      "BRILLIANT",




    ];

    List<String> filteredWords =
    words.where((word) => word.length == wordLength).toList();

    if (filteredWords.isNotEmpty) {
      return filteredWords[_getRandomIndex(filteredWords.length)];
    } else {
      // Handle case when no word of the specified length is available
      return '';
    }
  }

  int _getRandomIndex(int length) {
    return DateTime.now().millisecondsSinceEpoch % length;
  }

  String _initializeDisplayWord() {
    wordList = secretWord!.split('');
    displayWordList = List<String>.from(wordList);

    // Generate random indices for each letter except the first one
    List<int> randomIndices = List.generate(wordList.length - 2, (index) => index + 1);
    randomIndices.shuffle();

    // Replace the letters with underscores at the randomly generated indices
    for (int i = 0; i < randomIndices.length; i++) {
      int index = randomIndices[i];
      displayWordList[index] = '_';
    }

    return displayWordList.join(' ');
  }

  void guessLetter(String letter) {
    bool isCorrectGuess = false;
    for (int i = 1; i < wordList.length; i++) {
      if (wordList[i] == letter) {
        displayWordList[i] = letter;
        isCorrectGuess = true;
      }
    }
    if (!isCorrectGuess) {
      wrongLettersGuessed.add(letter);
    }
    displayWord = displayWordList.join(' ');
  }

  bool isWordGuessed() {
    return !displayWordList.contains('_');
  }

  bool hasLost() {
    return wrongLettersGuessed.length >= 6;
  }
}

