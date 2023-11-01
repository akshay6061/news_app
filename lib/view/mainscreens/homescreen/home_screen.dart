import 'package:flutter/material.dart';
import 'package:news_app/controller/homescreencontroller/MyController.dart';
import 'package:news_app/database/database.dart';
import 'package:news_app/view/detailednews/detailed_news.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  void initState() {
    Provider.of<My_Controller>(context, listen: false).fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeprovider = Provider.of<My_Controller>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 20, 68, 1),
          centerTitle: true,
          title: Text("NEWS 2DAY",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        body: Column(
          children: [
            Container(
              width: 390,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "search here",
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(8, 20, 68, 1), fontSize: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 50,
                    width: 410,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 90,
                          height: 0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.transparent,
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                          child: Center(
                              child: Text(
                            MyList[index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 15),
            //   child: Container(
            //     height: 400,
            //     width: 400,
            //     color: Colors.redAccent,
            //     child:
            //     ,
            //   ),
            // )
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
                items: List.generate(
                    homeprovider.responsedata?.articles?.length ?? 0,
                    (index) => Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Detailed_News(),
                                    ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          homeprovider.responsedata
                                                  ?.articles?[index].urlToImage
                                                  .toString() ??
                                              "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBhIIBwgVCgkXDQoREAwNDRsUChAWIBIWIiAdHx8YHSggGBolGxUfITEhJSkrLi4uFx8zODMsNygtLisBCgoKBQUFDgUFDisZExkrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrK//AABEIAMgA3wMBIgACEQEDEQH/xAAbAAEBAQADAQEAAAAAAAAAAAAABQcDBAYBAv/EADoQAQABAwADCwoGAwEAAAAAAAABAgMEBQYREhMWFyExVFWRktEiMjQ1UWFzdLKzBxRBQlKBFTNxI//EABQBAQAAAAAAAAAAAAAAAAAAAAD/xAAUEQEAAAAAAAAAAAAAAAAAAAAA/9oADAMBAAIRAxEAPwDYgAAAAAAAAAAAAAAAAAAAAAAAAACQkAAAAAAAAAAAAAAAAAAAAAAAAAAAkJAAAAAAAAAAAAAAAAAAAAAAAAAAAJCQAAAAAAAAAAAAAAAAAAAAAAAAAACQkAAAAAAAAAE3TOladFU29uNXfrrubimi3s3Uzs2/qCkIPCDK6gyO7T4nCDL6gyO7T4gvCDwgy+oMju0+Jwgy+oMju0+ILwg8IMvqDI7tPicIMvqDI7tPiC8IPCDL6gyO7T4nCDK6gyO7T4gvDo6H0jRpXBjKt25t0zVcjcVedExOx3gAAAAAACQkAAAAAAAABB1l9PwfnafoleQdZfT8H52n6JBeAAHHTetVXps03Im5EUzNET5URPNthyA47123Yt75eri3bjnqqnZTD842Vj5VG7xr1N2jm20VRNLxf4nzk73Z3O38r/6bdnm7v9Nv9Jn4cfmf83O9bd43qrfP4+7+9oNNfJ5n18nmBD1L9Rx8bK+5K6hal+o4+NlfcldAAAAAAAJCQAAAAAAAAEHWX0/B+dp+iV5B1l9PwfnafokF553WzWa3oWxvNiYuZsxyU89NEe2fA1s1mtaGsbzYmLmbMclP7aI9s+DK8i/dyb83r9c3LkztmqqfKmQdvE0vm4ukv8hbvzORuttVVU7d37Yn3NV1e05jabw99tTuLscly1M+VTPgxx29GaQydGZkZWJXuLkTzftqj2T7gbVes28i3vd+3Fy3PPTXG2mXFbtYejceardujGsxG6qmmmKaY98uhoTWHD0ro+crdxaqpp23aKp8z3/8eD1u1nr0xd/LYtU0YUTyRzVXJ9s+73A93oTWTA0zfrsY9W5uUzVspr5N8p/lCxPMwvHv3ca/F6xXNu5E7YqpnyolqequstvTVjer0xbzKaeWj9tce2PAHLqX6jj42V9yV1C1L9RR8XK+5K6AAAAAAASEgAAAAAAAAPJ/iBlXMHHx8qz/ALKciqY2x5O3cS9Yk6w6Es6cx6bN+7VbimvdRNERy8mz9QZBkX7uTfm9frm5cmds1VTtqmXG0bi8wem3Oyk4vMHptzspBnI0bi8wem3Oyk4vMHptzspBnUV1UxMU1bImNkxE88PjRuLzB6bc7KTi8wem3OykGcuTHv3Ma9F6xXNu5E7YqpnZVEtC4vMHptzspOLzB6bc7KQU9RK5r1bt11ctU3MiZ78vQOjoXRtvROj6cO1XNyiJqmKqvO5Z2u8AAAAAAASEgAAAAAAAAAAAAAAAAAAAAAAAAAAEhIAAAAAAAAAAAAAAAAAAAAAAAAAABISAAAAAAAAAAAAAAAAAAAAAAAAAAASEgAAAAAAAAAAAAAAAAAAAAAAAAAAEhIAAAAAAAAAAAAAAAAAAAAAAAAAABIA//9k=",
                                        ),
                                        fit: BoxFit.cover)),
                                height: 200,
                              ),
                            ),
                            Positioned(
                                bottom: 50,
                                child: Column(
                                  children: [
                                    Text(
                                        homeprovider.responsedata
                                                ?.articles?[index].title
                                                .toString() ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        homeprovider.responsedata
                                                ?.articles?[index].author
                                                .toString() ??
                                            "",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ))
                          ],
                        )),
                options: CarouselOptions(
                  height: 250,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
            Container(
              height: 340,
              child: ListView.builder(
                  itemCount: homeprovider.responsedata?.articles?.length ?? 1,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            width: double.infinity,
                            height: 530,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(8, 20, 68, 1),
                                border: Border.all(color: Colors.black)),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.sizeOf(context).height * .3,
                                  width: double.infinity,
                                  child: Image.network(homeprovider.responsedata
                                          ?.articles?[index].urlToImage
                                          .toString() ??
                                      ""),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: MediaQuery.sizeOf(context).width * .4,
                                    child: Column(
                                      children: [
                                        Text(
                                            homeprovider.responsedata?.articles?[index].title
                                                    .toString() ??
                                                "no result",
                                            maxLines: 5,
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 19)),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 70,top: 20),
                                                  child: Text(homeprovider.responsedata?.articles?[index].author
                                                  .toString() ??
                                                  "",
                                                  style: TextStyle(
                                                  color: Colors.white, fontSize: 19),),
                                                )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
