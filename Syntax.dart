//Dart shorthand Function:
//String getFullName(String firstName, String lastName) => '$firstName $lastName';

// To make any type nullable
String a = "asd";
a = null;
List<String?>? name = ['hello',null];
name = null;

// To pick a null value from different variables!
const String? Fname = null;
const String? Mname = 'Hello';
const String? Lname = 'Baz';

const String? nullName = Fname ?? Mname ?? Lname;

// To transfer value of other variable if previous was null!
String? name ??= Fname;
name ??= Mname;
name ??= Lname;

// "?." to use optional null conditions
void test(List<String>? name)
{
  final len = name?.length ?? 0;
  // this will put name list length in len and if it is null
  // then 0 will be transfered into len.
  name?.add("value");
  //even u cant unconditionaly put add value in list.
}
