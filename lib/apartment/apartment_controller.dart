
import 'package:http/http.dart' as htttp;


class ApartmentController{
  String uri ="https://appartments-85947-default-rtdb.europe-west1.firebasedatabase.app";
  getcategories()async{
    htttp.Response response = await   htttp.get(Uri.parse("$uri/categorey.json"));
    Map data =
}
}