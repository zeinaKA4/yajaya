class Api {
  static const _baseUrl = 'http://192.168.1.9/api_inventory_course';
  //jangan lupa ganti ip, kalo beda jaringan internet
  static const user = '$_baseUrl/user';
  static const product = '$_baseUrl/product';
  static const history = '$_baseUrl/history';
  static const inout = '$_baseUrl/inout';

  static const add = 'add.php';
  static const update = 'update.php';
  static const delete = 'delete.php';
  static const gets = 'get.php';
  static const search = 'search.php';
  static const count = 'count.php';
}
