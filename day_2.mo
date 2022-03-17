import Array "mo:base/Array";
import Blob "mo:base/Blob";
import Bool "mo:base/Bool";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Prim "mo:prim";
import Text "mo:base/Text";

actor {
  //1
  // public func nat_to_nat8(n : Nat) : async Nat8 {
  //   return(Nat8.fromNat(n));
  // };

  public func nat_to_nat8(n : Nat) : async Nat8 {
    if(n > 255){
      return 0;
    } else {
      return(Nat8.fromNat(n));
    }
  };

  //2
  // public func max_number_with_n_bits(n : Nat) : async Nat {
  //   return 2**n - 1;
  // };
  public func max_number_with_n_bits(n : Nat) : async Nat {
    var count = n;
    var max = 0;
    while(count > 0){
      max := max + 2**(count - 1);
      count := count - 1;
    };
    return max;
  };

  //3 incomplete
  // public func decimals_to_bits(n : Nat) : async Text {
  //     var m = n;
  //     var bits = "";
  //     while(m > 0){
  //         let remainder = m % 2;
  //         let m = m / 2;
  //         if(remainder == 1){
  //             bits = "1" # bits;
  //         } else {
  //             bits = "0" # bits;
  //         };
  //     };
  //     return(bits)
  // };

  //4 incomplete
  public func capitalize_character(c : Char) : async Char {
    let unicodeValue = Char.toNat32(c);
    if(unicodeValue >= 97 or unicodeValue <= 122){
      return(Char.fromNat32(unicodeValue - 32));
    }else{
      return(Char.fromNat32(unicodeValue));
    }
  };

  //5 incomplete
  func _capitalize_character(c : Char) : Char {
    let unicodeValue = Char.toNat32(c);
    if(unicodeValue >= 97 or unicodeValue <= 122){
      return(Char.fromNat32(unicodeValue - 32));
    }else{
      return(Char.fromNat32(unicodeValue));
    };
  };
  public func capitalize_text(t : Text) : async Text {
    var newWord : Text = "";
    for(c in t.chars()){
      newWord := Char.toText(_capitalize_character(c));
    };
    return(newWord);
  };

  // //6 incomplete
  // public func is_inside(t : Text, l : Text) : async Bool {
  //   let p = #text(l);
  //   return(Text.contains(t, p));
  // };

  //7 incomplete
  public func trim_whitespace(t : Text) : async Text {
    let pattern = #text(" ");
    return(Text.trim(t, pattern));
  };

  //8 incomplete
    // public func duplicate_character(t : Text) : async Text {
    //     var characters : [Char] = [];
    //     for (character in t.vals()){
    //         switch(Array.filter(characters, f(x) : Text -> Bool {x == character})){
    //             case(null) {
    //                 characters := Array.append<Text>(characters, [character]);
    //             };
    //             case(?char){
    //                 return Char.toText(char);
    //             };
    //         };
    //     };
    //     return (t);
    // };

  //9 incomplete
  public func size_in_bytes(t : Text) : async Nat {
    let utfBlob = Text.encodeUtf8(t);
    let arrayBytes = Blob.toArray(utfBlob);
    return(arrayBytes.size());
  };
  
  //10 incomplete
  func swap(array : [Nat], i : Nat, j : Nat) : [Nat] {
    let mutableArray = Array.thaw<Nat>(array : [Nat]);
    let temp = mutableArray[i];
    mutableArray[i] := mutableArray[j];
    mutableArray[j] := temp;
    return Array.freeze<Nat>(mutableArray);
  };
  public func bubble_sort(array : [Nat]) : async [Nat] {
    var sorted = array;
    let size = array.size();
    for(i in Iter.range(0, size - 1)){
      for(j in Iter.range(0, size - 1 - i)){
        if(sorted[j] > sorted[j + 1]){
          sorted := swap(sorted, i, j);
        };
      };
    };
    return sorted;
  };

};