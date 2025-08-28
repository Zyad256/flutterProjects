import 'questions.dart';

class Data {
  int _num = 0;
List<Question> _questions = [
     Question(image: "images/Questions/ابن.webp", text: 'فيلم اسماعيل ياسين في البوليس؟', answer: false),
     Question(image: "images/Questions/البيضه.webp", text: 'فيلم البيضة و الحجر؟', answer: true),
     Question(image: "images/Questions/العميل.webp", text: 'فيلم المخبر السري؟', answer: false),
     Question(image: "images/Questions/العيال.webp", text: 'مسرحية سك علي بناتك؟', answer: false),
     Question(image: "images/Questions/المتسول.webp", text: 'فيلم البيه البواب؟', answer: false),
     Question(image: "images/Questions/النمر.jpg", text: 'فيلم النمر الأسود؟', answer: true),
     Question(image: "images/Questions/المدمن.webp", text: '"فيلم الهرم الرابع؟ "تأثير الكلية', answer: false),
     Question(image: "images/Questions/بناتك.webp", text: 'مسرحية سك علي بناتك؟', answer: true),
     Question(image: "images/Questions/مستر.webp", text: 'فيلم مستر كاراتيه؟', answer: true),
     Question(image: "images/Questions/مدرسة.webp", text: 'مسرحية مدرسة المشاغبين؟', answer: true),
  ];

  String getImage(){
      return _questions[_num].image;
  }

  String getText(){
      return _questions[_num].text;
  }

  bool getAnswer(){
      return _questions[_num].answer;
  }
  
  void nextQuestion(){
    if(_num < _questions.length - 1)
    _num++;
  }

  bool isFinished(){
    if(_num >= _questions.length -1)
    return true;
    else
    return false;
  }

  void reset(){
    _num = 0;
  }
}
