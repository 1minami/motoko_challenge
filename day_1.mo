import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {
  //1
  public func add(n : Nat, m : Nat) : async Nat {
    return n + m;
  };

  //2
  public func square(n : Nat) : async Nat {
    return n * n;
  };

//3
  public func days_to_second(n : Nat) : async Nat {
    return n * 24 * 60 * 60;
  };

  //4.1
  var counter : Nat = 0;
  public func increment_counter(n : Nat) : async Nat {
    counter += n;
    return counter;
  };

  //4.2
  public func clear_counter() : async Nat {
    counter := 0;
    return counter;
  };

  //5
  public func divide(n : Nat, m : Nat) : async Text {
    if(m == 0) {
      return("false");
    } else {
      return("true");
    };
  };

  //6
  public func is_even(n : Nat) : async Text {
    if(n % 2 == 0) {
      return("true");
    } else {
      return("false");
    };
  };

  //7
  public func sum_of_array(n : [Nat]) : async Nat {
    if (n.size() == 0) {
      return 0;
    } else {
      var sum = 0;
      for (n in n.vals()){
        sum += n;
      };
      return sum;
    };
  };

  //8
  public func maximum(n : [Nat]) : async Nat {
    if(n.size() == 0) {
      return 0;
    } else {
      var max = n[0];
      for (n in n.vals()){
        if(n > max) {
          max := n;
        };
      };
      return max;
    };
  };

  //9
  public func remove_from_array(n : [Nat], m : Nat) : async [Nat] {
    var new_array : [Nat] = [];
    for (n in n.vals()){
      if(n != m) {
        new_array := Array.append<Nat>(new_array, [n]);
      };
    };
    return new_array;
  };

  //10
  public func selection_sort(nums : [Nat]) : async [Nat] {
    return Array.sort(nums, Nat.compare);
  };
};