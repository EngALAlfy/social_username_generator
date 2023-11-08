import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:social_user_generator/utils/config.dart';

class MarkdownWidget extends StatelessWidget {
  MarkdownWidget({
    Key? key,
    required this.mdFileName,
  })  : assert(mdFileName.contains('.md'), 'The file must contain the .md extension'),
        super(key: key);

  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: Future.delayed(const Duration(milliseconds: 150)).then((value) {
              return rootBundle.loadString('assets/md/$mdFileName');
            }),
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return const Text(Config.errorHappened , style: TextStyle(fontSize: 19),);
              }

              if (snapshot.hasData) {
                return Markdown(
                  data: snapshot.data!,
                );
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}