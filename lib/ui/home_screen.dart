import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300 ],

      appBar: AppBar(
  backgroundColor: Colors.blueGrey[500 ],
        elevation: 0.9,
        title: Text("Welcome To Home"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(

            width: Get.width,
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [

                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 50,height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),

                                  ),
                                  const SizedBox(width: 8,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Name"),
                                      Text("20 min.")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.share,color: Colors.black,))
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text("For information on the generic Dart part of this file, see the For information on the generic Dart part of this file, see the For information on the generic Dart part of this file, see the For information on the generic Dart part of this file, see the "),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),

                SizedBox(width: Get.width,
                  // height: 150,
                  child: Image.network("https://images.unsplash.com/photo-1612442443556-09b5b309e637?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YW5kcm9pZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1100&q=60",
                    fit: BoxFit.fitWidth,),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("12 Likes"),
                          Text("12 Comments"),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){},
                              icon: Icon(Icons.thumb_up_alt_outlined,color: Colors.black,)),
                          Text("12 Comments"),
                        ],
                      ),
                    ],
                  ),
                ),




              ],
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) {
        return Container(width: Get.width,
          height: 10,
          color: Colors.grey,
        );
      },),
    );
  }
}





