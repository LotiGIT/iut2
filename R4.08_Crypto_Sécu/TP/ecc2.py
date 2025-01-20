import matplotlib as mpl
mpl.rcParams['figure.dpi'] = 180
import numpy as np
import matplotlib.pyplot as plt

A = -3
B = 5
#A=21
#B=37
def y_value(a, b, x):
    return pow(pow(x, 3) + x * a + b, 0.5)

class Point:
    def __init__(self, x=float('inf'), y=float('inf')):
        self.x = x
        self.y = y
        
    def __repr__(self):
        return "Point({}, {})".format(self.x, self.y)
    
    def __add__(self, pt):
        assert type(pt) is Point
        if self.x == pt.x and self.y == pt.y:
            return self.double()
        dx = pt.x - self.x
        dy = pt.y - self.y
        if dx == 0:
            return Point()
        pente = dy / dx
        x = (pente ** 2) - self.x - pt.x
        y = pente * x + (self.y - pente * self.x)
        return Point(x, -y)
    
    def double(self):
        pente = (3 * (self.x ** 2) + A) / (2 * self.y)
        x = (pente ** 2) - (2 * self.x)
        y = pente * x + (self.y - pente * self.x)
        return Point(x, -y)
    
    def oppsite(self):
        return Point(self.x, -self.y)
    
    def np(self):
        return np.array([self.x, self.y])

def plot_ec():
    y, x = np.ogrid[-5:5:100j, -5:5:100j]
    z = pow(y, 2) - pow(x, 3) - x * A - B

    plt.contour(x.ravel(), y.ravel(), z, [0])
    plt.axhline(y=0, color='r')
    plt.axvline(x=0, color='b')


def plot_distinct_point_curve(p0, p1, p0_annotation, p1_annotation, third_point_annotation, sum_point_annotation):
    plot_ec()
    
    p2 = p0 + p1

    line0 = np.array([
        p0.np(),
        p2.oppsite().np(),
        p1.np()
    ])
    plt.plot(line0[:,0], line0[:,1], marker='o')
    plt.annotate(p0_annotation, xy=line0[0], xytext=(-5, 5), textcoords='offset points')
    plt.annotate(p1_annotation, xy=line0[2], xytext=(-5, 5), textcoords='offset points')
    plt.annotate(third_point_annotation, xy=line0[1], xytext=(-5, 5), textcoords='offset points')

    line1 = np.array([
        p2.oppsite().np(),
        p2.np()
    ])
    plt.plot(line1[:,0], line1[:,1], marker='o')
    plt.annotate(sum_point_annotation, xy=line1[1], xytext=(0, 5), textcoords='offset points')

    plt.grid()
    plt.show()
    

def plot_double_point_curve(p, p_annotation, sum_point_annotation):
    plot_ec()
    
    p2 = p.double()
plot_distinct_point_curve(a, b,'A', 'B', '', 'A + B')
    line0 = np.array([
        p.np(),
        p2.oppsite().np(),
    ])
    plt.plot(line0[:,0], line0[:,1], marker='o')
    plt.annotate(p_annotation, xy=line0[0], xytext=(-5, 5), textcoords='offset points')

    line1 = np.array([
        p2.oppsite().np(),
        p2.np()
    ])
    plt.plot(line1[:,0], line1[:,1], marker='o')
    plt.annotate(sum_point_annotation, xy=line1[1], xytext=(0, 5), textcoords='offset points')

    plt.grid()
    plt.show()
    

def plot_n_point_curve(p, n, p_annotation, sum_point_annotation):
    plot_ec()
    
    current_p = p
    for _ in range(n):
        current_p += p

    line0 = np.array([
        p.np(),
        current_p.np(),
    ])
    plt.plot(line0[:,0], line0[:,1], linestyle='--', marker='o')
    plt.annotate(p_annotation, xy=line0[0], xytext=(-5, 5), textcoords='offset points')
    plt.annotate(sum_point_annotation, xy=line0[1], xytext=(-5, 5), textcoords='offset points')

    plt.grid()
    plt.show()
    plot_ec()

plt.grid()
plt.show()

a = Point(-2.1, y_value(A, B, -2.1))
b = Point(0.2, y_value(A, B, 0.2))
c = Point(-2.2, y_value(A, B, -2.2))

ab = a + b
bc = b + c

plot_distinct_point_curve(a, b,'A', 'B', '', 'A + B')