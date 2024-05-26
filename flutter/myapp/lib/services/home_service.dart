import 'package:http/http.dart' as http;

//ekhane api te hit kore data niye asbe then value return korbe
class HomeService {
  Future<http.Response> getData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";

    http.Response response = await http.get(Uri.parse(url));
    return response;
  }
}
