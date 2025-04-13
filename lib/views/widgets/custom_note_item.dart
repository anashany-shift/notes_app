import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24,bottom: 24,left: 16),
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(

            title: Text(
              'Flutter Tips',
              style: TextStyle(fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16.0,bottom: 16),
              child: Text(
                'build your career with Anas',
                style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.5)),
              ),
            ),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete,size:30,)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Text(
              'May21 , 2025',
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
          )
        ],
      ),
    );
  }
}
