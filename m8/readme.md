	TASK8

import math

def validate_param():
    attepmts = 3
    while attepmts > 0:
        try:
            print('do you have {attepmts} attepmts')
            a = int(input("Enter value for a:"))
            b = int(input("Enter value for b:"))
            c = int(input("Enter value for c:"))
        except ValueError:
            print("Value is not integer")
            attepmts = 1
            continue
        else:
            return a, b, c


def discriminant(a, b, c):
    discr = b ** 2 - 4 * a *c
    return discr


def roots(discr, a, b, c):
    if discr > 0:
        x1 = (-b + math.sqrt(discr)) / (2 * a)
        x2 = (-b - math.sqrt(discr)) / (2 * a)
        print("x1 = %.2f \nx2 = %.2f" %(x1, x2))
        return x1, x2
    elif discr == 0:
        x = -b / (2 * a)
        print("x = %.2f" % x)
        return x
    else:
        print("Equation no have roots")


def solv_square(a, b, c) -> roots:
    discr = discriminant(a, b, c)
    root = roots(discr, a, b, c)
    print("Discriminant =", discr)
    return root


def square_print(a, b, c, roots):
    print("a =", a)
    print("b =", b)
    print("c =", c)
    roots


def main():
    print("Enter youar values for equation:")
    valid_params = validate_param()
    a = valid_params[0]
    b = valid_params[1]
    c = valid_params[2]
    solv_square(a, b, c)
    square_print(a, b, c, roots)


if __name__ == "__main__":
    main()
