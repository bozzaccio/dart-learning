class IHuman {
  String whoAmI() {}
}

abstract class AbstractHuman implements IHuman {
  final String name;
  final String gender;

  AbstractHuman(this.name, this.gender);

  @override
  String whoAmI() {
    print("Hi i'm $name and i'm a $gender");
  }
}

class Male extends AbstractHuman {
  Male(String name) : super(name, "Male");
}

class Female extends AbstractHuman {
  Female(String name) : super(name, "Female");
}

void main(List<String> args) {
  Male male = new Male("William");
  Female female = new Female("Britney");

  male.whoAmI();
  female.whoAmI();
}
