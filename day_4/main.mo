import Custom "custom";
import Animal "animal";
import List "mo:base/List";

actor {
  //1
  public type Pilot = Custom.Pilot;
  public func fun() : async Pilot {
    var eva : Pilot = {
      name = "asuka";
      age = 14;
    };
    return eva;
  };
  
  //2
  public type Animal = Animal.Animal; //2
  let animal : Animal = {
    specie = "";
    energy = 0;
  };

  //4
  public func create_animal_then_takes_a_break(specie : Text, energy : Nat) : async Animal {
    let newAnimal : Animal = {
      specie = specie;
      energy = energy;
    };
    return Animal.animal_sleep(newAnimal);
  };

  //5
  public type List<Animal> = ?(Animal, List<Animal>); //5
  var animals : List<Animal> = List.nil<Animal>();

  //6
  public func push_animal(animal : Animal) {
    var push = List.push<Animal>(animal : Animal, animals : List<Animal>);
  };
  public func get_animals() : async [Animal] {
    return List.toArray<Animal>(animals : List<Animal>);
  };

};