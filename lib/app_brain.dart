import 'question.dart';

class AppBrain {
            int _qustionNumber = 0 ;
        List<Question> _questionGroup = [
        Question (
        q: "The number of solar planets is 8 planets" , 
        i: "images/image-1.jpeg",
        a: true,
      ),
        Question (
        q: "Cats are carnivores" , 
        i: "images/image-2.jpeg",
        a: true,
        ),
                Question (
        q: "China is located on the African continent" , 
        i: "images/image-3.jpeg",
        a: false,
      ),
        Question (
        q: "The earth is flat, not round" , 
        i: "images/image-4.jpeg",
        a: false,
        ),
                Question (
        q: "A person can live without eating meat " , 
        i: "images/image-5.jpeg",
        a: true,
        ),
                Question (
        q: "The sun revolves around the earth and the earth revolves around the moon" , 
        i: "images/image-6.jpeg",
        a: false,
      ),
        Question (
        q: "Animals don't feel pain" , 
        i: "images/image-7.jpeg",
        a: false,
        ),

      ];

      void nextQuestion() {
        if (_qustionNumber < _questionGroup.length - 1 ){
          _qustionNumber++;
        }
      }

      String getQuestionText() {
        return _questionGroup[_qustionNumber].questionTexe ; 
      }
            String getQuestionImage() {
        return _questionGroup[_qustionNumber].questionImage ; 
      }
            bool getQuestionAnswer() {
        return _questionGroup[_qustionNumber].questionAnswer ; 
      }

      bool isFinished() {
        if(_qustionNumber >= _questionGroup.length - 1){
          return true ;
        }else {
          return false ;
        }
      }

      void reset () {
        _qustionNumber = 0 ;
      }
}