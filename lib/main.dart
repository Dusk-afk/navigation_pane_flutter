import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(
    FluentApp(
      home: const MainScreen(),
      theme: ThemeData(
        brightness: Brightness.dark
      ),
    )
  );
}

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        selected: _currentPage,
        onChanged: (i) => setState(() => _currentPage = i),
        // displayMode: PaneDisplayMode.top,
        items: <NavigationPaneItem>[
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text("Home")
          ),
          PaneItem(
            icon: const Icon(FluentIcons.fabric_folder),
            title: const Text("Files")
          ),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text("Settings")
          ),
        ]
      ),

      content: NavigationBody(
        index: _currentPage,
        transitionBuilder: (child, animation) => EntrancePageTransition(child: child, animation: animation),
        children: const <Widget>[
          HomePage(),
          FilesPage(),
          SettingsPage()
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("Home"));
}

class FilesPage extends StatelessWidget {
  const FilesPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("Files"));
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Center(child: Text("Settings"));
}
