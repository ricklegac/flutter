    import 'package:flutter/material.dart';
    
    class ListViewBuilderScreen extends StatefulWidget {
       
      const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesId =[1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollcontroller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollcontroller.addListener(() {
      //print ('${scrollcontroller.position.pixels}, ${scrollcontroller.position.maxScrollExtent}');
      if ((scrollcontroller.position.pixels+500)>=scrollcontroller.position.maxScrollExtent){
        add5();
      }
    });
  }
  void add5(){
    final lastId = imagesId.last;
    imagesId.addAll(
      [1,2,3,4,5].map((e) => lastId+e)
    );
    setState(() {
      
    });
  }
      @override
      Widget build(BuildContext context) {
        return  Scaffold(
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,

            child: ListView.builder(
              controller: scrollcontroller,
              itemCount: imagesId.length,
              itemBuilder: (BuildContext context, int index){
                return  FadeInImage(
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
                placeholder: const AssetImage('assets/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/237/500/300?image=${imagesId[index]}'),
                );
              },
            ),
          ),
          // appBar:  AppBar(
          //   title:  const Text('List View Builder'),
          // ),
          
        );
      }
}