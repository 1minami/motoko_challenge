import Cycles "mo:base/ExperimentalCycles";
import HashMap "mo:base/HashMap";
import Principal "mo:base/Principal";

actor {
  public shared(msg) func whoami() : async Principal {
    let principal_caller = msg.caller;
    return(principal_caller);
  };

  //1
  public shared(msg) func is_anonymous() : async Bool {
    let principalCaller = msg.caller;
    let principalAnonymous = Principal.isAnonymous(principalCaller : Principal);
    return(principalAnonymous);
  };

  //2
  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  //3
  public shared(msg) func add_favorite_number(n : Nat) {
    let principalCaller = msg.caller;
    favoriteNumber.put(principalCaller : Principal, n : Nat)
  };
  public shared(msg) func show_favorite_number() : async ?Nat {
    let principalCaller = msg.caller;
    let n = favoriteNumber.get(principalCaller : Principal);
    switch(n) {
      case(null) {
        return null;
      };
      case(_) {
        return(n : ?Nat);
      };
    }
  };
  
  //4
  public shared(msg) func add_favorite_number2(n : Nat) : async Text {
    let principalCaller = msg.caller;
    let fav = favoriteNumber.get(principalCaller : Principal);
    if(fav == null) {
      favoriteNumber.put(principalCaller : Principal, n : Nat);
      return("You've successfully registered your number");
    } else {
      return("You've already registered your number");
    }
  };

  //5
  public shared(msg) func update_favorite_number(n : Nat) : async ?Nat {
    let principalCaller = msg.caller;
    let upd = favoriteNumber.get(principalCaller : Principal);
    switch(upd) {
      case(null) {
        return null;
      };
      case(_) {
        return favoriteNumber.replace(principalCaller : Principal, n : Nat);
      };
    }
  };
  public shared(msg) func delete_favorite_number(){
    let principalCaller = msg.caller;
    let n = favoriteNumber.get(principalCaller : Principal);
    switch(n) {
      case(null) {};
      case(_) {
        return favoriteNumber.delete(principalCaller : Principal);
      };
    }
  };

  //6
  public func deposit_cycles() : async Nat {
    let available = Cycles.available();
    let received = Cycles.accept(available : Nat);
    return(received);
  };

  //7
  //8
  //9
  //10
}