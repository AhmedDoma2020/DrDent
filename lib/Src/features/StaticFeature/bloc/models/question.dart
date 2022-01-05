


class Question {
  late int id ;
  late String question;
  late String answer;
  late bool expanded;

  Question({this.id=0, this.question='', this.answer='', this.expanded=false});

  Question.fromJson(Map<String,dynamic>map){
    id = map['id']??0;
    question = map['question']??' ';
    answer = map['answer']??' ';
    expanded = false;
  }
}