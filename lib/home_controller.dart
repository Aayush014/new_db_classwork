import 'package:get/get.dart';
import 'package:new_db/db_helper.dart';

class HomeController extends GetxController
{
  DbHelper dbHelper = DbHelper();
  RxList empList = [].obs;

  @override
  void onInit() {
    super.onInit();
    initDB();
  }

  Future<void> initDB()
  async {
    print("-----------------init DB CALLED------------------");
    await dbHelper.initDatabase();

  }

  Future<void> addData()
  async {
    await dbHelper.insertData();
    await getEmployeeDetails();
  }

  Future<void> getEmployeeDetails()
  async {
    empList.value = await dbHelper.fetchData();
  }

  HomeController()
  {
    getEmployeeDetails();
  }


}