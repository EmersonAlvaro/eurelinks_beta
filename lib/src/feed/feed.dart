import 'package:flutter/material.dart';



class FeedNews extends StatelessWidget {
  const FeedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      bottom: false,

      child: Padding(
        padding: const EdgeInsets.all(8), 
        child: ,
      ),

      // child: Text("Hello FeedNews!"),
    );
  }
}

// class FeedNews extends StatelessWidget {
//   const FeedNews({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData(
//           colorScheme:
//               Theme.of(context).colorScheme.copyWith(primary: Colors.purple)),
//       child: const Text("Hello FeedNews!"),
//     );
//   }
// }
