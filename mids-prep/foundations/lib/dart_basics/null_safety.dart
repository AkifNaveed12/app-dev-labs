void main(){

String name = 'Morning Run';
int duration = 30;
String? note = null;


// String name = null; // Compile-time error
String? nickname = null;
  nickname = 'Aki';

  print(name);
  print(nickname);

  // null check
    if (note != null) {
    print(note.length);
  }
  else{
    print(note ?? 'No note provided');
  }

  // ??
String? username;

String displayName = username ?? 'Guest';

print(displayName); // Guest

Map<String, dynamic> json = {
  'name': 'Headphones',
  'brand': null,
};

String Name = json['name'] ?? 'Unknown';
String brand = json['brand'] ?? 'Generic';

print(Name);  // Headphones
print(brand); // Generic

// ??= operator — assign only if null
String? Nickname;

Nickname ??= 'Guest';
print(Nickname); // Guest

Nickname ??= 'Unknown';
print(Nickname); // Guest

// ! operator
String? naam = 'Akif';

print(naam!.length); // 4


// null safety
String displayNote(String? note) {
  return note ?? 'No note added';
}


  print(displayNote('Felt tired today'));
  print(displayNote(null));

}