signature MATH =
sig
  val fact: int -> int
  val halfPi: real
  val pow: int * int -> int
  val double: int -> int
end;

exception NegativeNum
structure MyMathLib :> MATH =
struct
  fun fact 1 = 1
    | fact x =
        if x > 0 then x * fact (x - 1) else raise NegativeNum
  val halfPi = 1.57
  fun pow (_, 0) = 1
    | pow (n, x) =
        if n > 0 then n * pow (n, x - 1) else raise NegativeNum
  fun double x =
    if x > 0 then x * 2 else raise NegativeNum
end;

fun useMyMathLib (n, opr) =
  let
    fun f n "fact" =
          print (Int.toString (MyMathLib.fact n))
      | f n "pow" =
          print (Int.toString (MyMathLib.pow (n, n)))
      | f n "double" =
          print (Int.toString (MyMathLib.double n))
      | f _ _ = raise Match
  in
    f n opr
  end
  handle NegativeNum => print "Nao posso lidar com numeros negativos!";

useMyMathLib (2, "pow");

useMyMathLib (~3, "fact");
