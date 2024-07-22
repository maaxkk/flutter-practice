import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/adapters.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  Future<Box<User>>? userBox;
  void setup() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    userBox = Hive.openBox<User>('user_box');
    userBox?.then((box) {
      box.listenable().addListener(() {
        print(box.length);
      });
    });
  }

  void doSome() async {

    // const secureStorage = FlutterSecureStorage();
    // // if key not exists return null
    // final encryptionKeyString = await secureStorage.read(key: 'key');
    // if (encryptionKeyString == null) {
    //   final key = Hive.generateSecureKey();
    //   await secureStorage.write(
    //     key: 'key',
    //     value: base64UrlEncode(key),
    //   );
    // }
    // final key = await secureStorage.read(key: 'key');
    // final encryptionKeyUint8List = base64Url.decode(key!);
    // print('Encryption key Uint8List: $encryptionKeyUint8List');
    // final encryptedBox = await Hive.openBox('vaultBox', encryptionCipher: HiveAesCipher(encryptionKeyUint8List));
    // encryptedBox.put('secret', 'Hive is cool');
    // print(encryptedBox.get('secret'));


    // To put object in Hive we have to make adapter!
    final box = await userBox;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PetAdapter());
    }
    final petBox = await Hive.openBox<Pet>('pet_box');

    final pet = Pet('Pushok');
    await petBox.add(pet);
    final user = User('John', 30, HiveList(petBox, objects: [pet]));
    await box?.add(user);
    // await Hive.deleteBoxFromDisk('testBox');
    // var box = await Hive.openBox<User>('testBox');
    // var petBox = await Hive.openBox<Pet>('petBox');
    // final user = box.get('joe');
    // final user = User('Joe', 40);
    // if (user != null) {
    //   user.age = 12;
    //   await box.put('joe', user);
    // }
    // user?.age = 1000;
    // final pet = Pet('Pushok');
    // final pet2 = Pet('Sharik');
    // await petBox.add(pet);
    // await petBox.add(pet2);
    // final pets = HiveList(petBox, objects: [pet, pet2]);
    // user?.pets = pets;
    // await user?.save();
    // print(user?.pets?[0]);
    // await box.add(user);
    // final userFromBox = box.getAt(0);
    // print(userFromBox);
    // print(box.get('joe'));
    // await box.close();

    // await box.put('name', 'John');
    // await box.put('age', 30);
    // await box.put('friends', ['Dave', 'Simon', 'Lisa']);
    // final index = await box.add(['Tony', 'Sam', 'Alex']);

    // final name = box.get('name') as String?;
    // final age = box.get('age') as int?;
    // final friends = box.get('friends') as List<dynamic>;
    // final surname = box.get('surname', defaultValue: 'Doe') as String;
    // final friends2 = box.getAt(index) as List<dynamic>;
    // final friends3 = box.getAt(0); // same as friends2 -> (index)

    // print(box.keys);
    // print(box.values);
    // await box.put('name', null);
    // await box.deleteFromDisk();
    // await box.delete('name');
    // box.deleteAt(1);
    // print(box.keys);
    // print(box.values);

    // print(name);
    // print(surname);
    // print(age);
    // print(friends);
    // print(friends2);

    // print(friends3);

    // final user1 = User('Joe Doe', 30);
    // await box.add(user1);
    // final userFromBox = box.getAt(5);
    // print(userFromBox);
    // print(box.keys);
    // print(box.values);
  }
}


@HiveType(typeId: 0)
class User extends HiveObject {
  // removed HiveFieldsId: 2
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(3)
  HiveList<Pet>? pets;

  User(this.name, this.age, this.pets);

  @override
  String toString() {
    return 'Name: $name, Age: $age Pets: $pets';
  }
}

@HiveType(typeId: 1)
class Pet extends HiveObject {
  @HiveField(0)
  String name;
  Pet(this.name);

  @override
  String toString() {
    return 'Name: $name';
  }
}

// To put object in Hive we have to make adapter with unique typeId!
// class UserAdapter extends TypeAdapter<User> {
//   @override
//   int typeId = 0;
//
//   @override
//   User read(BinaryReader reader) {
//     final name = reader.readString();
//     final age = reader.readInt();
//     return User(name, age);
//   }
//
//   @override
//   void write(BinaryWriter writer, User obj) {
//     writer.writeString(obj.name);
//     writer.writeInt(obj.age);
//   }
// }
