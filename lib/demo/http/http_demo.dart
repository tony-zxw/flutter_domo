import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    // fetchPosts().then((value) => print(value));

    // final post = {
    //   'title': 'hello',
    //   'description': 'nice to meet you.',
    // };

    // print(post['title']);
    // print(post['description']);

    // final postJson = json.encode(post);
    // print(postJson);

    // final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted['title']);
    // print(postJsonConverted['description']);
    // print(postJsonConverted is Map);

    // final postModel = Post.fromJson(postJsonConverted);
    // print('title: ${postModel.title}, description: ${postModel.description}');

    // print('${json.encode(postModel)}');
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');

    // print('statusCode: ${response.statusCode}');
    // print('body: ${response.body}');
    if (response.statusCode == 200) {
      final responseBpdy = json.decode(response.body);
      List<Post> posts = responseBpdy['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();

      return posts;
    } else {
      throw Exception('Fiail to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot中带着future中的数据
        print('data:${snapshot.data}');
        print('connectionState:${snapshot.connectionState}');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {}
        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

//model
class Post {
  Post({
    this.id,
    this.title,
    this.author,
    this.imageUrl,
    this.description,
  });

  final int id;
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  // bool selected = false;

  // Post.fromJson(
  //     Map json, this.title, this.author, this.imageUrl, this.description);
  // Post.fromJson(Map json, this.title, this.description);
  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];
  // Post.fromJson(Map json)
  //     : title = json['title'],
  //       description = json['description'];

  Map toJson() => {
        'title': title,
        'descritpion': description,
      };
}
