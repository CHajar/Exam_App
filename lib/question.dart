class Question {
  String questionTexe = '';
  String questionImage = '';
  bool questionAnswer = true;

  Question({String q = '', String i = '', bool a = true}) {
    questionTexe = q;
    questionImage = i;
    questionAnswer = a;
  }
}