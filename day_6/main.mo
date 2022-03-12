import HTTP "http";
import Hash "mo:base/Hash";
import HashMap "mo:base/HashMap";
import List "mo:base/List";
import Nat "mo:base/Nat";
import Principal "mo:base/Principal";
import Result "mo:base/Result";
import Text "mo:base/Text";

actor {
  //1
  public type TokenIndex = Nat;
  public type Error = {
    #message : Text;
    #code : Nat;
  };

  //2
  let registry = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);

  //3
  stable var nextTokenIndex : Nat = 0;
  public shared ({caller}) func mint() : async Result.Result<Text, Text> {
    if(Principal.isAnonymous(caller)){
      return #err("Error: anonymous principal");
    } else {
      registry.put(nextTokenIndex, caller);
      nextTokenIndex += 1;
      return #ok("Success: token minted");
    }
  };

  //4
  public shared(msg) func transfer(to : Principal,tokenIndex : Nat) : async Result.Result<Text, Text> {
    let principalCaller = msg.caller;
    let trans = registry.get(tokenIndex);
    switch(trans) {
      case(null) {
        return #err("Error: anonymous principal");
      };
      case(_) {
        let rep = registry.replace(tokenIndex : Nat,to : Principal);
        return #ok("Success: token minted");
      };
    }
  };

  //5
  public type List<TokenIndex> = ?(TokenIndex, List<TokenIndex>);
  public shared(msg) func balance() : async List<TokenIndex> {
    let principalCaller = msg.caller;
    var token : List<TokenIndex> = List.nil<TokenIndex>();
    for((k, principal) in registry.entries()) {
      if(Principal.equal(principalCaller, principal)) {
        token := List.push<TokenIndex>(k, token);
      };
    };
    return token;
  };

  //6
  public query func http_request(request : HTTP.Request) : async HTTP.Response {
    var minted : Text = "minted" # Nat.toText(nextTokenIndex - 1);
    let response = {
      body = Text.encodeUtf8(minted);
      headers = [("Content-Type", "text/html; charset=UTF-8")];
      status_code = 200 : Nat16;
      streaming_strategy = null
      };
      return(response)
    };
  

  //7
  system func preupgrade() {
    return;
  };
  system func postupgrade() {
    return;
  };
};