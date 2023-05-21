(**************)
(*   PARTE 1  *)
(**************)
(**************)
(*Exercício 01*)
(**************)

datatype expr =
  IConst of int
| Plus of expr * expr
| Minus of expr * expr
| Multi of expr * expr
| Div of expr * expr
| Max of expr * expr
| Min of expr * expr
| Eq of expr * expr
| Gt of expr * expr;

fun eval (IConst i) = i
  | eval (Plus (e1, e2)) =
      (eval e1) + (eval e2)
  | eval (Minus (e1, e2)) =
      (eval e1) - (eval e2)
  | eval (Multi (e1, e2)) =
      (eval e1) * (eval e2)
  | eval (Div (e1, e2)) =
      if (eval e2) = 0 then 0 else (eval e1) div (eval e2)
  | eval (Max (e1, e2)) =
      if (eval e1) > (eval e2) then (eval e1) else (eval e2)
  | eval (Min (e1, e2)) =
      if (eval e1) < (eval e2) then (eval e1) else (eval e2)
  | eval (Eq (e1, e2)) =
      if (eval e1) = (eval e2) then 1 else 0
  | eval (Gt (e1, e2)) =
      if (eval e1) > (eval e2) then 1 else 0;

val p = Plus (IConst 2, IConst 3);
eval p;
val p = Minus (IConst 2, IConst 3);
eval p;
val p = Multi (IConst 2, IConst 3);
eval p;

val p = Div (IConst 0, IConst 0);
eval p;
val p = Div (IConst 2, IConst 3);
eval p;
val p = Max (IConst 2, IConst 3);
eval p;

val p = Min (IConst 2, IConst 3);
eval p;
val p = Eq (IConst 2, IConst 3);
eval p;
val p = Gt (IConst 2, IConst 3);
eval p;

val e1 = Max (IConst 3, Plus (IConst 2, IConst 3));
eval e1;
val e2 = Div (Multi (IConst 5, IConst 4), Minus (IConst 4, IConst 4));
eval e2;

(**************)
(*Exercício 02*)
(**************)

datatype area =
  RConst of real
| AQuadrado of area
| ARetangulo of area * area
| ACirculo of area;

val pi = Math.pi
fun eval (RConst r) = r
  | eval (AQuadrado a) = eval a * eval a
  | eval (ARetangulo (a1, a2)) =
      (eval a1) * (eval a2)
  | eval (ACirculo a) =
      3.14 * eval a * eval a

val e = ACirculo (RConst 2.0);
eval e;

(**************)
(*Exercício 03*)
(**************)

datatype perimetro =
  RConst of real
| PQuadrado of perimetro
| PRetangulo of perimetro * perimetro
| PCirculo of perimetro
| PTriangulo of perimetro * perimetro * perimetro;

val pi = Math.pi
fun eval (RConst r) = r
  | eval (PQuadrado a) = 4.0 * eval a
  | eval (PRetangulo (a1, a2)) =
      2.0 * (eval a1) + 2.0 * (eval a2)
  | eval (PCirculo a) = 2.0 * 3.14 * eval a
  | eval (PTriangulo (a, b, c)) =
      (eval a) + (eval b) + (eval c);

val e = PQuadrado (RConst 4.0);
eval e;

(**************)
(*Exercício 04*)
(**************)

datatype UnOp =
  Not;
datatype BinOp = Add | Sub | Mul | Gt | Eq | Or;
datatype Sexpr =
  IConst of int
| Op1 of UnOp * Sexpr
| Op2 of BinOp * Sexpr * Sexpr;

fun simplify (Op2 (Add, IConst 0, e)) = simplify e
  | simplify (Op2 (Add, e, IConst 0)) = simplify e
  | simplify (Op2 (Sub, e, IConst 0)) = simplify e
  | simplify (Op2 (Mul, IConst 1, e)) = simplify e
  | simplify (Op2 (Mul, e, IConst 1)) = simplify e
  | simplify (Op2 (Mul, IConst 0, _)) = IConst 0
  | simplify (Op2 (Mul, _, IConst 0)) = IConst 0
  | simplify (Op2 (Sub, e1, e2)) =
      let
        val e1_s = (simplify e1);
        val e2_s = (simplify e2)
      in
        if (e1_s = e2_s) then (IConst 0)
        else if ((e1 = e1_s) andalso (e2 = e2_s)) then (Op2 (Sub, e1, e2))
        else (simplify (Op2 (Sub, e1_s, e2_s)))
      end
  | simplify (Op1 (Not, Op1 (Not, e))) = (simplify e)
  | simplify (Op2 (Or, e1, e2)) =
      let
        val e1_s = (simplify e1);
        val e2_s = (simplify e2)
      in
        if (e1_s = e2_s) then e1_s else (Op2 (Or, e1_s, e2_s))
      end
  | simplify (Op1 (Not, e)) =
      let val e_s = (simplify e)
      in if (e = e_s) then (Op1 (Not, e)) else (simplify (Op1 (Not, e_s)))
      end
  | simplify (Op2 (Op, e1, e2)) =
      let
        val e1_s = (simplify e1);
        val e2_s = (simplify e2)
      in
        if ((e1 = e1_s) andalso (e2 = e2_s)) then (Op2 (Op, e1, e2))
        else (simplify (Op2 (Op, e1_s, e2_s)))
      end
  | simplify e = e;

val e1 = Op2 (Mul, Op2 (Add, IConst 1, IConst 0), Op2 (Add, IConst 9, IConst 0));
simplify e1;

val e2 = Op2 (Mul, Op2 (Add, IConst 1, IConst 0), Op2
  (Add, Op2 (Or, IConst 10, IConst 12), IConst 0));
simplify e2;

(**************)
(*   PARTE 3  *)
(**************)
(**************)
(*Exercício 03*)
(**************)

fun count_main (x: int) : int list =
  let
    fun count (y: int) : int list =
      case y of
        0 => []
      | 1 => [1]
      | y => (count (y - 1)) @ [y]
  in
    count x
  end;

count_main 5;

(**************)
(*Exercício 04*)
(**************)

fun pow (x: int) : int =
  let
    fun calculePow (y: int) : int = y * y
  in
    calculePow x
  end;

pow 3;

(**************)
(*Exercício 06*)
(**************)

fun split xs =
  let
    fun splitHelper (xs, evens, odds) =
      case xs of
        [] => (List.rev evens, List.rev odds)
      | [x] => (List.rev (x :: evens), List.rev odds)
      | x :: y :: rest => splitHelper (rest, x :: evens, y :: odds)
  in
    splitHelper (xs, [], [])
  end;

split [5, 52, 68, 83, 3];

split [1, 2, 3, 8, 4, 5];

(**************)
(*Exercício 07*)
(**************)

fun expr () : int =
  let val x = 1
  in let val x = 2 in x + 1 end + let val y = x + 2 in y + 1 end
  end;

expr ();
