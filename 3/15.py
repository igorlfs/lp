class FormulaError(Exception):
    pass


class OperationError(Exception):
    pass


def calculator(input: str):
    formula = input.split()
    if len(formula) != 3:
        raise FormulaError("A entrada não consiste de 3 elementos")
    try:
        a, b, c = float(formula[0]), formula[1], float(formula[2])
        match b:
            case "+":
                return a + c
            case "-":
                return a - c
            case "/":
                return a / c
            case "*":
                return a * c
            case _:
                raise OperationError("x não é um operador válido")
    except ValueError:
        print("O primeiro e o terceiro valor de entrada devem ser numeros")


# calculator("")  # FormulaError
# calculator("a + 2")  # ValueError
# calculator("1 | 1")  # OperationError

# print(calculator("1 + 1"))
