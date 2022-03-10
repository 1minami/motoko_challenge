module {
  //7
  public type List<T> = ?(T, List<T>);
  public func is_null(l : List<T>) : async Bool {
        switch(l){
            case(null) {
                return true;
            };
            case(?l){
                return false;
            };
        };
    };

  //8
  public func last<T>(l : List<T>) : ?T {
    switch l {
      case null { null };
      case (?(x, null)) { ?x };
      case (?(_, t)) { last<T>(t) };
    }
  };

  //9
  public func size<T>(l : List<T>) : Nat {
    func rec(l : List<T>, n : Nat) : Nat {
      switch l {
        case null { n };
        case (?(_, t)) { rec(t, n + 1) };
      }
    };
    rec(l,0)
  };

  //10
  public func get<T>(l : List<T>, n : Nat) : ?T {
    switch (n, l) {
      case (_, null) { null };
      case (0, (?(h, t))) { ?h };
      case (_, (?(_, t))) { get<T>(t, n - 1) };
    }
  };

  //11
    public func reverse<T>(l : List<T>) : List<T> {
    func rec(l : List<T>, r : List<T>) : List<T> {
      switch l {
        case null { r };
        case (?(h, t)) { rec(t, ?(h, r)) };
      }
    };
    rec(l, null)
  };
}