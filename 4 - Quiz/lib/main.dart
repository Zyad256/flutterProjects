import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'data.dart';

Data data = Data();
void main() {
  runApp(musicApp());
}

class musicApp extends StatelessWidget {
  const musicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amberAccent[200],
        appBar: AppBar(
          backgroundColor: Colors.green[100],
          title: Row(
            children: [
              // Icon(Icons.map),
              Text(
                "Little Quizra",
                style: TextStyle(
                  fontFamily: 'Edu',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        body: Padding(padding: const EdgeInsets.all(8.0), child: Questions()),

        // bottomNavigationBar: BottomAppBar(
        //   color: Colors.purple,
        //   child: Center(
        //     child: SizedBox(
        //       height: 35,
        //       child: Text(
        //         "Ziad Eltokhy 2025",
        //         style: TextStyle(
        //           fontFamily: 'Edu',
        //           fontWeight: FontWeight.bold,
        //           fontSize: 24,
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  void thumb(bool a) {
    if (data.getAnswer() == a) {
      rightAnswers++;
      rAndw.add(
        Padding(
          padding: EdgeInsets.all(5),
          child: Icon(Icons.thumb_up, color: Colors.green),
        ),
      );
    } else {
      rAndw.add(
        Padding(
          padding: EdgeInsets.all(5),
          child: Icon(Icons.thumb_down, color: Colors.red),
        ),
      );
    }
    if(data.isFinished()){
       Alert(
      context: context,
      type: AlertType.success,
      title: "انتهت الأسئلة",
      desc: "لقد أجبت علي $rightAnswers من 10",
      buttons: [
        DialogButton(
          child: Text(
            "مجدداً",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    data.reset();
    rAndw = [];
    rightAnswers = 0;
    }
    else{

    data.nextQuestion();
    }
  }

  List<Padding> rAndw = [];
  int rightAnswers =0;
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: rAndw),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(data.getImage(),height: 200,width: double.infinity,fit: BoxFit.cover,),
              SizedBox(height: 10),
              Text(
                data.getText(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  thumb(true);
                });
              },
              child: Text(
                "صح",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  thumb(false);
                });
              },
              child: Text(
                "خطأ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
