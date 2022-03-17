import Array "mo:base/Array";
import Option "mo:base/Option";

module {
  public func contains<A>(array [A], a: A, f: (A, A) -> Bool) -> Bool {
    Option.isSome(Array.find<A>(array, func(x) { f(x, a) }));
  };
}