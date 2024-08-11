import 'package:binge_guide/utilities/movieHolder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorite.dart';

class movieHolder extends StatefulWidget {
  String title;
  var rating;
  String image;

  movieHolder({required this.title, required this.rating, required this.image});

  @override
  State<movieHolder> createState() => _movieHolderState();
}

class _movieHolderState extends State<movieHolder> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(children: [
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            image: DecorationImage(
                image: NetworkImage(widget.image), fit: BoxFit.fill),
          ),
        ),
        Container(
          height: 130,
          padding: EdgeInsets.only(left: 5, top: 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rating : ' + widget.rating.toString(),
                    style: TextStyle(
                        color: Color(0xFFD27685),
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 85,
                      maxWidth: 200,
                      minHeight: 10,
                      minWidth: 10,
                    ),
                    child: Text(
                      'Title : ' + widget.title,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {
                    Provider.of<favoriteProvider>(context, listen: false)
                        .addMovie(widget.title, widget.rating, widget.image);
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Color(0xFF9E4784),
                    size: 30,
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}
