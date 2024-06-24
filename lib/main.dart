import 'package:flutter/material.dart';

class MCQ {
  final int id;
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  MCQ({
    required this.id,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _state = 1;
  void _toggle(int val) {
    setState(() {
      _state = val;
    });
  }

  Map<int, int> map = {};
  void _answerQuestion(int key, int val) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        map[key] = val;
      });
    });
  }

  List<MCQ> mcqs = [
    MCQ(
      id: 1,
      question: "What is the primary purpose of React?",
      options: [
        "a) To handle routing in single-page applications",
        "b) To create server-side applications",
        "c) To build user interfaces, especially for single-page applications",
        "d) To manage databases in web applications",
      ],
      correctOptionIndex: 2,
    ),
    MCQ(
      id: 2,
      question: "Which of the following is true about JSX?",
      options: [
        "a) It is a separate language that must be compiled into JavaScript",
        "b) It is a syntax extension that allows writing HTML within JavaScript",
        "c) It is used to write backend server code",
        "d) It is a CSS preprocessor used in React applications",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 3,
      question:
          "Which method in the React.Component lifecycle is called after the component is rendered for the first time?",
      options: [
        "a) componentWillMount",
        "b) componentDidMount",
        "c) componentWillUpdate",
        "d) componentDidUpdate",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 4,
      question: "How do you pass data to a React component?",
      options: [
        "a) Using components",
        "b) Using props",
        "c) Using state",
        "d) Using lifecycle methods",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 5,
      question: "What is the purpose of the `key` prop in React?",
      options: [
        "a) To uniquely identify elements in an array for performance optimization",
        "b) To pass data between components",
        "c) To handle event handlers",
        "d) To define styles for components",
      ],
      correctOptionIndex: 0,
    ),
    MCQ(
      id: 6,
      question:
          "Which of the following hooks is used to handle side effects in functional components?",
      options: [
        "a) useState",
        "b) useReducer",
        "c) useEffect",
        "d) useContext",
      ],
      correctOptionIndex: 2,
    ),
    MCQ(
      id: 7,
      question: "What is the virtual DOM in React?",
      options: [
        "a) A direct representation of the real DOM",
        "b) A lightweight copy of the real DOM that is kept in memory and synced with the real DOM by React",
        "c) A new browser feature used by React to improve performance",
        "d) A special API provided by React to handle asynchronous operations",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 8,
      question: "How can you create a functional component in React?",
      options: [
        "a) class MyComponent extends React.Component { render() { return <div>Hello</div>; }}",
        "b) function MyComponent() { return <div>Hello</div>; }",
        "c) const MyComponent = React.createComponent({ render() { return <div>Hello</div>; }});",
        "d) const MyComponent = createComponent({ render() { return <div>Hello</div>; }});",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 9,
      question: "What is the correct way to update state in a React component?",
      options: [
        "a) this.state = { key: value }",
        "b) this.setState({ key: value })",
        "c) this.updateState({ key: value })",
        "d) this.changeState({ key: value })",
      ],
      correctOptionIndex: 1,
    ),
    MCQ(
      id: 10,
      question:
          "What is the significance of the `defaultValue` attribute in a React `<input>` element?",
      options: [
        "a) It sets the initial value of an uncontrolled component",
        "b) It sets the value of a controlled component",
        "c) It provides a placeholder for the input",
        "d) It handles the form submission event",
      ],
      correctOptionIndex: 0,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: _state == 1
            ? StartScreen(
                toggle: _toggle,
              )
            : _state == 2
                ? SurveyPage(
                    mcqs: mcqs,
                    answerQuestion: _answerQuestion,
                    toggle: _toggle,
                  )
                : ResultPage(
                    toggle: _toggle,
                    map: map,
                    mcqs: mcqs,
                  ),
      ),
    );
  }
}

class StartScreen extends StatelessWidget {
  final Function(int) toggle;
  const StartScreen({required this.toggle, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/images/StartIcon.png"),
                width: 200,
                height: 200,
              ),
              Text(
                "intrect with",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 98, 98, 98)),
              ),
              Text(
                "Survey",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.name),
              ),
              Text(
                "Template",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: AutofillHints.name,
                    color: Colors.blue),
              ),
              Text(
                "For Flutter App",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: AutofillHints.name,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    toggle(2);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF000000),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.fromLTRB(80, 15, 80, 15)),
                  child: const Text(
                    'Start Survey',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("have and account ? ", style: TextStyle(fontSize: 20)),
                    Text("login",
                        style: TextStyle(color: Colors.blue, fontSize: 20))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SurveyPage extends StatefulWidget {
  final Function(int) toggle;
  final Function(int, int) answerQuestion;
  const SurveyPage(
      {required this.answerQuestion,
      required this.mcqs,
      required this.toggle,
      super.key});
  final List<MCQ> mcqs;
  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(30, 70, 30, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Ultimate Flutter Survey",
            style: TextStyle(
                color: Color.fromARGB(255, 8, 144, 255),
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "Choose the correct option that best answers each multiple-choice question.",
            style: TextStyle(fontSize: 15),
          ),
          ...widget.mcqs.map((mcq) {
            return Question(mcq: mcq, answerQuestion: widget.answerQuestion);
          }),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                widget.toggle(3);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF000000),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(80, 15, 80, 15)),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Question extends StatefulWidget {
  final Function(int, int) answerQuestion;
  const Question({super.key, required this.mcq, required this.answerQuestion});
  final MCQ mcq;
  @override
  // ignore: library_private_types_in_public_api
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String _selectedOption = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${widget.mcq.id}.${widget.mcq.question}",
            style: const TextStyle(
              color: Color.fromARGB(255, 8, 144, 255),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[0]),
            leading: Radio<String>(
              value: "A",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 0);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[1]),
            leading: Radio<String>(
              value: "B",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 1);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[2]),
            leading: Radio<String>(
              value: "C",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 2);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
          ListTile(
            title: Text(widget.mcq.options[3]),
            leading: Radio<String>(
              value: "D",
              groupValue: _selectedOption,
              onChanged: (String? value) {
                setState(() {
                  _selectedOption = value!;
                  widget.answerQuestion(widget.mcq.id, 3);
                });
              },
              activeColor: const Color(0xFF6200EE),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  const ResultPage(
      {required this.map, required this.toggle, required this.mcqs, super.key});
  final Map<int, int> map;
  final List<MCQ> mcqs;
  final Function(int) toggle;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: [
          const Center(
              child: Text(
            "Result",
            style: TextStyle(
                color: Color.fromARGB(255, 8, 144, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
          ...widget.mcqs.map((mcq) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "${mcq.id}.${mcq.question}",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 8, 144, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  mcq.options[mcq.correctOptionIndex],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  mcq.options[widget.map[mcq.id] ?? 0],
                  style: TextStyle(
                      fontSize: 18,
                      color: mcq.correctOptionIndex == widget.map[mcq.id]
                          ? Colors.green
                          : Colors.red),
                )
              ],
            );
          }),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              widget.toggle(1);
              widget.map.clear();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF000000),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(80, 15, 80, 15)),
            child: const Text(
              'Start again',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

