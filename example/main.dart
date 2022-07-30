void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? customValidationFunctionOne(String? value) {
    if (value != null && value.contains('@')) {
      return 'incorrect symbol';
    }
    return null;
  }

  String? customValidationFunctionTwo(String? value) {
    if (value != null && value.contains('!')) {
      return 'incorrect symbol';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final validationAssistant = ValidationAssistant();

    return Scaffold(
      appBar: AppBar(title: const Text('ValidationAssistant Demo Page')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validationAssistant
              ..required('error message')
              ..add(customValidationFunctionOne)
              ..add(customValidationFunctionTwo),
          ),
        ),
      ),
    );
  }
}
