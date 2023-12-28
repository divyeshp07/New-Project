import 'package:flutter/material.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('fav'),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => SizedBox(
                  child: Card(
                      child: ListTile(
                leading: CircleAvatar(),
                title: Text('ghh'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Text('data'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('data'),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                count--;
                              });
                            },
                            icon: Icon(Icons.horizontal_rule_outlined)),
                        Text(count.toString()),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                count++;
                              });
                            },
                            icon: Icon(Icons.add)),
                      ],
                    ),
                  ],
                ),
              )))),
    );
  }
}

// import 'package:flutter/material.dart';

// class Fav extends StatefulWidget {
//   const Fav({Key? key}) : super(key: key);

//   @override
//   State<Fav> createState() => _FavState();
// }

// class _FavState extends State<Fav> {
//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('fav'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (context, index) => SizedBox(
//           child: Card(
//             child: ListTile(
//               leading: CircleAvatar(),
//               title: Text('ghh'),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('data'),
//                   Text('data'),
//                   Text('data'),
//                   Text('data'),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('data'),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             count--;
//                           });
//                         },
//                         icon: Icon(Icons.horizontal_rule_outlined),
//                       ),
//                       Text(count.toString()),
//                       IconButton(
//                         onPressed: () {
//                           setState(() {
//                             count++;
//                           });
//                         },
//                         icon: Icon(Icons.add),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
