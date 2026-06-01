import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

# Definimos constantes
m1, m2 = 1.0, 1.0

n = 1000
dt = 0.01
t = np.arange(0, (n+1)*dt, dt)

# VALORES A MODIFICAR PARA OBSERVAR FIGURAS DE LISSAJOUS
k1 = 1.0
k2_values = np.linspace(1.0, 8*np.pi, 400)
k2_values *= k1

# Definir objetos para la animación
fig, ax = plt.subplots()

line, = ax.plot([], [])

ax.set_xlim(-1.5, 1.5)
ax.set_ylim(-1.5, 1.5)

def Lissajous(k1, k2):
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

    return x, y

def update(frame):
    k2 = k2_values[frame]

    x, y = Lissajous(k1, k2)
    line.set_data(x, y)

    ax.set_title(f"Figuras de Lissajous con k2 = {k2:.2f} * k1")
    ax.set_xlabel("x(t)")
    ax.set_ylabel("y(t)")
    ax.grid(True)

    return line,

ani = FuncAnimation(fig, update, frames=400, interval=200)
ani.save("Lissajous.gif", writer="pillow", fps=20)