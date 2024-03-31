import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic>userInfoMap,String id) async {
    return await FirebaseFirestore.instance
      .collection("Users")
      .doc(id)
      .set(userInfoMap);
    }

    //get data
    Future<Stream<QuerySnapshot>> getUserDetails() async{
      return await FirebaseFirestore.instance.collection("Users").snapshots();
    }

    //update
    Future updateUserDetails(String id, Map<String,dynamic>updateInfo) async {
      return await FirebaseFirestore.instance.collection("Users").doc(id).update(updateInfo);
    }

    //delete
     Future deleteUserDetails(String id) async {
  await FirebaseFirestore.instance.collection("Users").doc(id).delete();
}

}