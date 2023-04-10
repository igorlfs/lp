(* Exercício 1 *)
fun cube (x: real) : real = x * x * x;
cube 3.0; (* 27.0 *)

(* Exercício 2 *)
fun pow (_: int, 0) : int = 1
  | pow (x: int, 1) : int = x
  | pow (x, y) =
      x * pow (x, y - 1);
pow (5, 2); (* 25 *)

(* Exercício 3 *)
exception DifferentLenghts;
fun sumLists (xs: int list, ys: int list) : int list =
  case (xs, ys) of
    ([], []) => []
  | ([], _) => raise DifferentLenghts
  | (_, []) => raise DifferentLenghts
  | (x :: xs', y :: ys') => (x + y) :: sumLists (xs', ys');
sumLists ([2, 5, 10], [1, 15, 4]); (* [3, 20, 14] *)

(* Exercício 4 *)
fun max (xs: int list) : int =
  case xs of
    [] => 0
  | [x] => x
  | x :: xs' =>
      let val maxRest = max xs'
      in if x > maxRest then x else maxRest
      end;
max [2, 1, 7, 3]; (* 7 *)

(* Exercício 5 *)
fun cumSum [] = []
  | cumSum xs =
      let
        fun cumSum' (acc, []) = rev acc
          | cumSum' (acc, x :: xs') =
              let val s = x + hd acc
              in cumSum' (s :: acc, xs')
              end
      in
        cumSum' ([hd xs], tl xs)
      end;
cumSum [6, 10, 3, 11]; (* [6, 16, 19, 30] *)
cumSum [];

(* Exercício 6 *)
fun greet s : string =
  case s of
    "" => "Hello nobody"
  | s => "Hello " ^ s;
greet "Janis"; (* Hello Janis *)
greet ""; (* Hello nobody *)

(* Exercício 7 *)
fun split s =
  String.tokens
    (fn c => c = #"," orelse c = #"." orelse c = #"-" orelse c = #" ") s;
split "Good morning to-you";

(* Exercício 8 *)
fun allTrue (cs: bool list) : bool =
  case cs of
    [] => false
  | [x] => x
  | x :: cs => x andalso allTrue cs;
allTrue [true, true, false, true];
allTrue [true, true, true];

(* Exercício 9 *)
datatype dinheiro =
  Centavos of int
| Reais of real
| Pessoa_Dinheiro of string * real;
fun amount (Centavos x) = x
  | amount (Reais x) =
      Real.round (x * 100.0)
  | amount (Pessoa_Dinheiro (_, x)) =
      Real.round (x * 100.0);

val d = Reais 2.0;
amount d;
val d = Centavos 2;
amount d;
val d = Pessoa_Dinheiro ("Gene", 2.5);
amount d;

(* Exercício 10 *)
datatype Planeta =
  Mercurio
| Venus
| Terra
| Marte
| Jupiter
| Saturno
| Urano
| Netuno;
fun planetAge (m: int, p: Planeta) : int =
  case p of
    Mercurio => Real.round ((Real.fromInt (m * 88)) / 12.0)
  | Venus => Real.round ((Real.fromInt (m * 225)) / 12.0)
  | Terra => Real.round ((Real.fromInt (m * 365)) / 12.0)
  | Marte => Real.round ((Real.fromInt (m * 687)) / 12.0)
  | Jupiter => Real.round ((Real.fromInt (m * 4332)) / 12.0)
  | Saturno => Real.round ((Real.fromInt (m * 10760)) / 12.0)
  | Urano => Real.round ((Real.fromInt (m * 30681)) / 12.0)
  | Netuno => Real.round ((Real.fromInt (m * 60190)) / 12.0);
planetAge (24, Jupiter);

(* Exercício 11 *)
datatype btree =
  Leaf
| Node of (btree * int * btree);
fun sumAll Leaf = 0
  | sumAll (Node (left, x, right)) =
      sumAll left + x + sumAll right;
val t = Node (Node (Leaf, 1, Leaf), 6, Node (Leaf, 12, Leaf));
sumAll t;

(* Exercício 12 *)
fun multiPairs (x, y) =
  ListPair.map (fn (x, y) => x * y) (x, y);
multiPairs ([2, 5, 10], [4, 10, 8]);

(* Exercício 13 *)
fun compose (f, g, x, y) =
  f (g (x, y));
fun square x = x * x;
fun sum (x, y) = x + y;
fun squareOfSum (x, y) = compose (square, sum, x, y);
