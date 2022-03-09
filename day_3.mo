import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Nat "mo:base/Nat";

actor {
  //1
  private func swap(ar : [var Nat], j : Nat, i : Nat) : async [Nat] {
    var new_array : Buffer.Buffer<Nat> = Buffer.Buffer(0);
    for (ar in ar.vals()){
      if (j == i){
        new_array.add(ar);
      } else if (j < i){
        new_array.add(ar);
      } else {
        new_array.add(ar);
      };
    };
    return new_array.toArray();
  };

  //2 init_count

  //3
  public func seven(n : [Nat]) : async Text {
    var i : Nat = n[0];
    if(i%7 == 0){
      return "Seven is found";
    } else {
      return "Seven not found";
    };
  };

  //4
  public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
    switch(n){
      case(?n) {
        return n;
      };
      case(null) {
        return m;
      };
    };
  };

  //5
  public func day_of_the_week(n : ?Nat) : async Text {
    switch(n){
      case(?1) {
        return "Monday";
      };
      case(?2) {
        return "Tuesday";
      };
      case(?3) {
        return "Wednesday";
      };
      case(?4) {
        return "Thursday";
      };
      case(?5) {
        return "Friday";
      };
      case(?6) {
        return "Saturday";
      };
      case(?7) {
        return "Sunday";
      };
      case(n) {
        return "null";
      };
    };
  };

  //6 populate_array

  //7 sum_of_array

  //8
  public func squared_array(ar : [Nat]) : async [Nat] {
    let square = func (n : Nat) : Nat {
      return n*n;
    };
    let new_array = Array.map(ar, square);
    return new_array;
  };
  
  //9
  public func increase_by_index(ar : [Nat]) :async [Nat] {
    let increase = func (n : Nat, i : Nat) : Nat {
      return n+i;
    };
    let new_array = Array.mapEntries(ar, increase);
    return new_array;
  };

  //10 contains<A>


};