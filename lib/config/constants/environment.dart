import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironment() async {
    dotenv.load(fileName: '.env');
  }

  static String apiUrl =
      'http://192.168.1.83:3000/api' ?? 'No está configurado el API_URL';
}
