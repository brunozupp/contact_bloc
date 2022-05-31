import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        children: const [
          _ButtonCard(
            label: "Example",
            route: "/bloc/example/",
          ),
          _ButtonCard(
            label: "Example Freezed",
            route: "/bloc/example/freezed/",
          ),
          _ButtonCard(
            label: "Contact Bloc",
            route: "/contact/list/",
          ),
          _ButtonCard(
            label: "Contact Cubit",
            route: "/contact/cubit/list/",
          ),
        ],
      ),
    );
  }
}

class _ButtonCard extends StatelessWidget {

  final String label;
  final String route;

  const _ButtonCard({
    Key? key,
    required this.label,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
