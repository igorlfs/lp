signature MATH =
sig
  val fact: int -> int
  val halfPi: real
  val pow: int * int -> int
  val double: int -> int
end;
(*:> significa selamento opaco*)
(* (diga que o tipo é explicitamente MATH)*)
structure MyMathLib :> MATH =
struct
  fun fact 0 = 1
    | fact x =
        x * fact (x - 1)
  val halfPi = Math.pi / 2.0
  fun pow (_, 0) = 1
    | pow (n, x) =
        n * pow (n, x - 1)
  fun double x = x * 2
end;
