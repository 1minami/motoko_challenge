import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
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
  /*Buffer version
  public func remove_from_array(n : [Nat], m : Nat) : async [Nat] {
    let new_array : Buffer.Buffer<Nat> = Buffer.Buffer(0);
    for (n in n.vals()){
      if(n != m) {
        new_array.add(n);
      };
    };
    return new_array.toArray();
  };
  */

  /*10
  public func selection_sort(nums : [Nat]) : async [Nat] {
    return Array.sort(nums, Nat.compare);
  };

  //10 alternative
  public func selectionSort(array : [Nat]) : async [Nat] {
        var toMutable : [var Nat] = Array.thaw<Nat>(array : [Nat]);
        let size = array.size();

        for(i in Iter.range(0, size - 1)){
            var min = i;
            for(j in Iter.range(i, size - 1)) {
                if(toMutable[min] > toMutable[j]) {
                    min := j;
                };
            };
            if(min != i) {
                let temp = toMutable[i];
                toMutable[i] := toMutable[min];
                toMutable[min] := temp;
            }
        };
        return(Array.freeze<Nat>(toMutable : [var Nat]));
    };
  */
};