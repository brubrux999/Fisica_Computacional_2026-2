import copy

def gauss_jordan(A, b=None):
    """
    Resuelve Ax = b y/o calcula la inversa de A usando Gauss-Jordan.
    
    Parámetros:
        A : matriz cuadrada (lista de listas)
        b : vector (lista). Si es None, solo calcula la inversa.
    
    Retorna:
        Si b != None: solución x
        Si b == None: inversa de A
    """
    n = len(A)
    
    # Copia profunda de A
    A = copy.deepcopy(A)

    # Construir matriz aumentada
    if b is not None:
        # Sistema Ax = b
        for i in range(n):
            A[i].append(b[i])
        m = n + 1
    else:
        # Inversa: augmentar con identidad
        for i in range(n):
            A[i] += [1 if i == j else 0 for j in range(n)]
        m = 2 * n

    # Eliminación Gauss-Jordan
    for i in range(n):
        # Pivote 1
        pivot = A[i][i]
        if pivot == 0:
            # Buscar fila para intercambio
            for k in range(i+1, n):
                if A[k][i] != 0:
                    A[i], A[k] = A[k], A[i]
                    pivot = A[i][i]
                    break
            else:
                raise ValueError("La matriz es singular o no se puede resolver.")

        # Normalizar fila
        for j in range(m):
            A[i][j] /= pivot

        # Hacer ceros en columna i
        for k in range(n):
            if k != i:
                factor = A[k][i]
                for j in range(m):
                    A[k][j] -= factor * A[i][j]

    # Extraer resultado
    if b is not None:
        return [A[i][-1] for i in range(n)]
    else:
        return [fila[n:] for fila in A]


# ---------------- EJEMPLO ----------------

A = [
    [2, 7, -1, 1],
    [3, 0, 0, 4],
    [-1, -2, -3, 0],
    [1, 5, 5, 2]
]

b = [2, 5, 4, 0]

# Resolver sistema
x = gauss_jordan(A, b)
print("Solución x =", x)

# Inversa de A
A_inv = gauss_jordan(A)
print("Inversa de A:")
for fila in A_inv:
    print(fila)