import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";

actor {
  //1
  // private func swap(ar : [var Nat], j : Nat, i : Nat) : async [Nat] {
  //   var new_array : Buffer.Buffer<Nat> = Buffer.Buffer(0);
  //   for (ar in ar.vals()){
  //     if (j == i){
  //       new_array.add(ar);
  //     } else if (j < i){
  //       new_array.add(ar);
  //     } else {
  //       new_array.add(ar);
  //     };
  //   };
  //   return new_array.toArray();
  // };
  private func swap(array : [Nat],i : Nat, j : Nat) : async [Nat] {
    let mutableArray = Array.thaw<Nat>(array : [Nat]);
    mutableArray[i] := array[j];
    mutableArray[j] := array[i];
    return Array.freeze<Nat>(mutableArray);
  };

  //2 init_count
  public func init_count(n : Nat) : async [Nat] {
    var array : Buffer.Buffer<Nat> = Buffer.Buffer(0);
    for (n in Iter.range(0, n)){
      array.add(n);
    };
    return array.toArray();
  };

  //3
  // public func seven(n : [Nat]) : async Text {
  //   var i : Nat = n[0];
  //   if(i%7 == 0){
  //     return "Seven is found";
  //   } else {
  //     return "Seven not found";
  //   };
  // };
  public func seven(array : [Nat]) : async Text {
    let arrayText : [Text] = Array.map<Nat, Text>(array : [Nat], Nat.toText);
    let seven : Char = '7';
    for(number in arrayText.vals()){
      for(char in number.chars()){
        if(char == seven){
          return "Seven is found";
        };
      };
    };
    return "Seven not found";
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
      case(_) {
        return "null";
      };
    };
  };

  //6 populate_array
  public func populate_array(array : [?Nat]) : async [Nat] {
    Array.map<?Nat,Nat>(array : [?Nat], func(x) {
      switch(x){
        case(?x) {
          return x;
        };
        case(null) {
          return 0;
        };
      };
    });
  };

  //7 sum_of_array
  public func sum_of_array(array : [Nat]) : async Nat {
    let sum = Array.foldLeft<Nat, Nat>(array : [Nat], 0, func(a, b) {a + b});
    return sum;
  };

  //8
  public func squared_array(ar : [Nat]) : async [Nat] {
    let square = Array.map<Nat, Nat>(ar : [Nat], func(x) {x * x});
  };
  
  //9
  public func increase_by_index(ar : [Nat]) :async [Nat] {
    return Array.mapEntries<Nat, Nat>(ar : [Nat], func(x, i) {x + i});
  };

  //10 contains<A>

};