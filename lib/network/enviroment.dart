abstract class Enviroment {
  final String API = 'https://vacantes.informaticaelectoral.com/v1/api/';
  final String STORAGE =  'http://10.112.32.81:8002/storage/';

  Future<dynamic> getResponse(String url);
  Future<dynamic> postResponse(String url, body);
}