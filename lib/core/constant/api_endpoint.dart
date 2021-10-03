class ApiEndpoint{
  static const String baseUrl = 'https://www.themealdb.com/';

  static const String prefix = 'api/json/';

  static const String apiKey = '1/';

  static const String version = 'v1/';

  static const String api = baseUrl + prefix + version + apiKey;

  static const String categories = api + 'categories.php';

  static const String areas = api + 'list.php?a=list';
  
  static String detailMeal({required String id}){
    return api + 'lookup.php?i=$id';
  }

  static String search({required String name}){
    return api + 'search.php?s=$name';
  }
  
  static String firstLetter({required String letter}){
    return api + 'search.php?f=$letter';
  }

}