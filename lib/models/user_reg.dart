class UserReg {
  final String userName;
  final String userLastName;
  final String userBirth;
  final Gender userGender;

  const UserReg({
    this.userName,
    this.userLastName,
    this.userBirth,
    this.userGender,
  });
}

enum Gender { woman, man, other, notSay }
