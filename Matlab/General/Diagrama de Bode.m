%Diagrama de Bode
%Ejemplo inicial de muestra
num=[0 1 2]
den=[1 3 1]
F=tf(num,den)

%1.0 Bode
s=tf('s')
display('ganancia F(s)=K')
f=15/1
bode(f,[0 1])
grid

%f<1
f=0.5
bode(f,[0 1])
grid

%f<0
f=-15
bode(f,[0 1])
grid

%cuando es integrador
s=tf('s')
display('integrador')
display('F(s)=1/s')
f=1/s
w=[0.1,100]
bode(f,w)
grid

%f=1/s^2
s=tf('s')
display('F(s)=1/s')
f=1/s^2
w=[0.1,100]
bode(f,w)
grid

%f=100/s
s=tf('s')
display('integrador')
display('F(s)=100/s')
g=100/s
w=[0.1,100]
bode(g,w)
grid

%Como se haria a mano
f=1/s
k=100*s/s
bode(f,k,g,w)
grid

%Caso del Derivador
s=tf('s')
display('derivador')
display('F(s)=s')
F=tf([1 0],1)
bode(F,w)
grid

%Sistema de primer orden
s=tf('s')
display('primer orden')
display('F(s)=5/(s+5)')
f=tf(5,[1 5])
bode(f)
grid

%sistema con un cero
s=tf('s')
display('un cero')
display('F(s)=(s+5)/5')
f=tf([1 5],5)
bode(f)
grid
%para ver la ganancia
g=(s+5)
bode(g)
grid

%Sistema cuadratico
s=tf('s')
h=5*(s+3)/(s*(s+5))
bode(h)
grid

%Sistema de segundo orden
s=tf('s')
display('bode de segundo grado sobre amortiguado')
display('F(s)=20/((s+2)*(s+10))')
f=tf(20,conv([1 2],[1 10]))
bode(f)
grid

%comandos alternativos
[num,den]=tfdata(f,'v')
pole(f)
zero(f)
dcgain(f)
[z,p,k]=zpkdata(f)

%criticamente amortiguado
s=tf('s')
display('bode de segundo grado criticamente amortiguado')
display('F(s)=4/(s+2)^2')
f=tf(4,conv([1 2],[1 2]))
bode(f)
grid

%sistema SUB-AMORTIGUADO
s=tf('s')
display('bode de segundo grado SUB-AMORTIGUADO')
w=10
sita=0.1
num=[0 0 w^2]
den=[1 2*sita*w w^2]
g=tf(num,den)
ww=[0.1 100]
bode(num,den,{1,100})
grid }
%ganancia en la frecuencia de corte w=wo
db=-20*log10(2*sita)
%frecuencia de resonancia wr
wr=w*sqrt(1-2*sita^2)
%peack de resonancia
Mr=1/(2*sita*sqrt(1-sita^2))

Mdb=20*log10(Mr)
w1=w*log10(2/sita)/2
w2=w*log10(2/sita)

hold on
display('bode de segundo grado orden sub-amortiguado')
for sita=0.1:0.1:1
num=[0 0 w^2]
den=[1 2*sita*w w^2]
bode(num,den,{1,100})
end
hold off
grid