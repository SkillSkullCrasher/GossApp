import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:gosapp/common/models/user_model.dart';

class ContactsRepository {
  final FirebaseFirestore firestore;
  ContactsRepository({required this.firestore});
  Future<List<List>> getAllContacts() async {
    List<UserModel> firebaseContacts = [];
    List<UserModel> phoneContacts = [];
    try{
      if(await FlutterContacts.requestPermission()){
        final usercollection=await firestore.collection('users').get();
        final allContactsInThePhone= await FlutterContacts.getContacts(withProperties: true,);
        bool isContactFound=false;
        for(var contact in allContactsInThePhone){
          for(var firebaseContactData in usercollection.docs){
            var firebaseContact=UserModel.fromMap(firebaseContactData.data());
          }
        }
      }
    }
    
  }
}


6:39