import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np

fig,ax= plt.subplots()
line, = ax.plot([],[], 'r-')

def init():
    ax.set_xlim(0,2*np.pi)
    ax.set_ylim(-1.1,1.1)
    line.set_data([],[])
    return line,

def update(frame):
    x= np.linspace(0,2*np.pi, 100)
    y= np.sin(x+ frame*0.1)
    line.set_data(x,y)
    return line,
ani=animation.FuncAnimation(fig, update,frames=200,init_func=init, blit=True, interval=20)
plt.show()

