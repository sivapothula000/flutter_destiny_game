import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Your car blows a tire on an empty, twisting road. No signal. A rusty pickup slows and a man in a wide-brimmed hat offers a ride: "Need a lift?"',
      choice1: 'Yes — I\'ll take the ride.',
      choice2: 'Hold on — are you safe to ride with?',
    ),
    Story(
      storyTitle:
          'He nods without a smile and revs the engine. The road ahead is long and quiet.',
      choice1: 'Fine. I\'ll climb in.',
      choice2: 'I can change the tire myself.',
    ),
    Story(
      storyTitle:
          'As you drive, he talks about small things — then asks you to open the glovebox. Inside: a knife, a weird key, and an old cassette tape.',
      choice1: 'Cool — give him the tape. Talk music.',
      choice2: 'This feels wrong — grab the knife and act.',
    ),
    Story(
      storyTitle:
          'You decided to be stubborn and try to fix the car yourself. While working, a truck swerves — your choice had consequences.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyTitle:
          'Things go badly after you act. The car crashes and you regret the rush of violence.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyTitle:
          'You and the stranger laugh at the tape and talk all the way to the next town. He drops you off — safe, if strange.',
      choice1: 'Restart',
      choice2: '',
    ),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && _storyNumber == 0) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 0) {
      _storyNumber = 1;
    } else if (choiceNumber == 1 && _storyNumber == 2) {
      _storyNumber = 5;
    } else if (choiceNumber == 2 && _storyNumber == 2) {
      _storyNumber = 4;
    } else if (choiceNumber == 1 && _storyNumber == 1) {
      _storyNumber = 2;
    } else if (choiceNumber == 2 && _storyNumber == 1) {
      _storyNumber = 3;
    } else if (_storyNumber == 3 || _storyNumber == 4 || _storyNumber == 5) {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber == 0 || _storyNumber == 1 || _storyNumber == 2;
  }
}
