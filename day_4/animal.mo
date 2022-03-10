module {
  //2
  public type Animal = {
    specie: Text;
    energy: Nat;
  };

  //3
  public func animal_sleep(animal : Animal) : Animal {
    var plus : Animal = {
      specie = animal.specie;
      energy = animal.energy +10;
    };
    return plus;
  };

};