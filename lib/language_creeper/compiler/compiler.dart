import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/java.dart';
import 'package:languagecreeper/apiService.dart';

class MultiLanguageCompiler extends StatefulWidget {
  const MultiLanguageCompiler({Key? key}) : super(key: key);

  @override
  _MultiLanguageCompilerState createState() => _MultiLanguageCompilerState();
}

class _MultiLanguageCompilerState extends State<MultiLanguageCompiler> {
  late CodeController _codeController;

  // Define themes
  Map<String, TextStyle> themes = {
    "Monokai-sublime": TextStyle(color: Colors.white, backgroundColor: Colors.black87, fontSize: 16),
    "Atom": TextStyle(color: Colors.black87, backgroundColor: Colors.white, fontSize: 16),
    "Darcula": TextStyle(color: Colors.orange, backgroundColor: Colors.black87, fontSize: 16),
    "VS": TextStyle(color: Colors.blueAccent, backgroundColor: Colors.grey[200]!, fontSize: 16),
  };

  // Supported languages and their initial source code
  Map<String, dynamic> languages = {
    "Python": {"language": python, "template": "def main():\n    print(\"Hello, Python!\")\n\nmain()"},
    "C++": {
      "language": cpp,
      "template": "#include <iostream>\nusing namespace std;\n\nint main() {\n    cout << \"Hello, C++!\" << endl;\n    return 0;\n}"
    },
    "JavaScript": {"language": javascript, "template": "console.log('Hello, JavaScript!');"},
    "Java": {
      "language": java,
      "template": "public class Main {\n    public static void main(String[] args) {\n        System.out.println(\"Hello, Java!\");\n    }\n}"
    },
  };

  String currentTheme = "Monokai-sublime";
  String currentLanguage = "Python";

  @override
  void initState() {
    super.initState();
    _codeController = CodeController(
      text: languages[currentLanguage]!["template"],
      language: languages[currentLanguage]!["language"],
    );
  }

  void _updateLanguage(String language) {
    setState(() {
      currentLanguage = language;
      _codeController.text = languages[currentLanguage]!["template"];
      _codeController.language = languages[currentLanguage]!["language"];
    });
  }

  void _updateTheme(String themeName) {
    setState(() {
      currentTheme = themeName;
    });
  }

  Future<void> _runCode() async {
    String code = _codeController.text;
    var result = await ApiService.executeCode(currentLanguage, code);

    // Ensure result["output"] and result["error"] are always treated as Strings
    String output = result["output"]?.toString() ?? result["error"]?.toString() ?? "Unknown Error";

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OutputPage(output: output),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi-Language Code Editor"),
        backgroundColor: Color(0xFF1A4D2E),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueGrey,
              icon: const Icon(Icons.code, color: Colors.white),
              items: languages.keys.map((String languageName) {
                return DropdownMenuItem<String>(
                  value: languageName,
                  child: Text(languageName, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  _updateLanguage(value);
                }
              },
            ),
          ),
          const SizedBox(width: 10),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: Colors.blueGrey,
              icon: const Icon(Icons.color_lens_outlined, color: Colors.white),
              items: themes.keys.map((String themeName) {
                return DropdownMenuItem<String>(
                  value: themeName,
                  child: Text(themeName, style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  _updateTheme(value);
                }
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          color: themes[currentTheme]?.backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: CodeField(
              controller: _codeController,
              textStyle: themes[currentTheme]!,
              maxLines: null,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: _runCode,
        child: const Icon(Icons.play_arrow_sharp),
      ),
    );
  }
}

class OutputPage extends StatelessWidget {
  final String output;
  const OutputPage({required this.output, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Code Output")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(output, style: const TextStyle(fontFamily: 'monospace', fontSize: 16)),
      ),
    );
  }
}
