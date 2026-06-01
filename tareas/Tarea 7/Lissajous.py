import numpy as np
import matplotlib.pyplot as plt

# Definimos constantes
m1, m2 = 1.0, 1.0

# VALORES A MODIFICAR PARA OBSERVAR FIGURAS DE LISSAJOUS
k1 = 1.0
k2_values = np.array([1.0, 2.0, 3.0])
k2_values *= k1

n = 1000
dt = 0.01

t = np.arange(0, (n+1)*dt, dt)

def Lissajous(k1, k2_values):
    for k2 in k2_values:
        
        # Arrays
        x = np.zeros(n+1)
        v_x = np.zeros(n+1)

        y = np.zeros(n+1)
        v_y = np.zeros(n+1)

        # Condiciones inciales
        x[0] = 1.0
        v_x[0] = 0.0

        y[0] = 1.0
        v_y[0] = 0.0

        # Resolvemos el sistema con Euler-Cromer
        for i in range(n):
            # Oscilador en x
            v_x[i+1] = v_x[i] - (k1/m1)*x[i]*dt
            x[i+1] = x[i] + v_x[i+1]*dt

            # Oscilador en y
            v_y[i+1] = v_y[i] - (k2/m2)*y[i]*dt
            y[i+1] = y[i] + v_y[i+1]*dt

        plt.plot(x, y, label=f"k2 = {k2}*k1")

Lissajous(k1, k2_values)

# Graficamos
plt.xlabel("x(t)")
plt.ylabel("y(t)")
plt.title("Figuras de Lissajous")

plt.legend()
plt.grid(True)

plt.savefig("./Lissajous.png")