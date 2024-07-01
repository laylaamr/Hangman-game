import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Hangman!');


  List<String> words = ['apple', 'banana', 'cherry', 'date', 'night'];


 late Random random = Random();
late String selectedWord = words[random.nextInt(words.length)];


  int lives = 6;
  late Set<String> guessedLetters = Set();


  late List<String> wordBlanks = List.filled(selectedWord.length, '_');

  while (lives > 0) {
    print('\nWord: ${wordBlanks.join(' ')}');
    print('Lives remaining: $lives');
    print('Guessed letters: ${guessedLetters.join(', ')}');


    print('Guess a letter: ');
   late String input = stdin.readLineSync()?.toLowerCase() ?? '';

    if (input.isEmpty || input.length > 1 || !input.contains(RegExp(r'[a-z]'))) {
      print('Invalid input. Please enter a single letter.');
      continue;
    }

    if (guessedLetters.contains(input)) {
      print('You already guessed "$input". Try a different letter.');
      continue;
    }

    guessedLetters.add(input);

    if (selectedWord.contains(input)) {

      for (int i = 0; i < selectedWord.length; i++) {
        if (selectedWord[i] == input) {
          wordBlanks[i] = input;
        }
      }

      if (!wordBlanks.contains('_')) {
        print('\nCongratulations! You guessed the word: $selectedWord');
        break;
      }
    } else {
      print('Incorrect guess. Try again.');
      lives--;
    }
  }

  if (lives == 0) {
    print('\nGame over! The word was: $selectedWord');
  }
}