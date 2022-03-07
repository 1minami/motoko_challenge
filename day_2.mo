import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  //1: async Nat8
  public func nat_to_nat8(n : Nat) : async Nat8 {
    return(Nat8.fromNat(n));
  };

  //2: async Nat
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return 2**n - 1;
  };

};