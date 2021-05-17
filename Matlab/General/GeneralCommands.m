%%%%
%%%%COMMANDS
%%%%
%clear all          clear variables in memory
%clc                clear console
%whos               List of variables in memory
%save variable.mat  It save the variable in the folder
%load variable.mat  It load the variable in the folder


%%%%
%Matrix
%%%%

x1=[1,2,3,4]
x2=[1,2,3,4;5,6,7,8]
z=zeros(3,3)
q=ones(3,3)
M=magic(2)
m_transpose = M' %Transnpose columns to rows
I=inv(M) %Inverse of matrix 

%Array Indexing
M=magic(5)
a=M(5,1)
a=M(2,1:5) %Column 2, 1:5 range elements
%To ingreased the format
format long
format short

%Examples operations
q2=q+20
q3=sin(q2)

%%%%
%%%%Matriz concadenations
%%%%
x1=[1,2,3;4,5,6;7,8,9]
x2=ones(3,3)
%Horizontal
z=[x1,x2]
z=[x2,x1]
%vertical
z=[x1;x2]
z=[x2;x1]

%%%%
%%%%Complex numbers
%%%%
x1=sqrt(-1)
x2=sqrt(-2)
z=x1+x2

%%%%
%%%%Ploting graphs
%%%%
x=0:pi/100:2*pi; % x= init_value:increase:max_value
y=cos(x);
plot(x,y);
xlabel('x values');
ylabel('y values');
title('Sine plot');
shg;
plot(x,y,'r'); %Color
plot(x,y,'r--'); %Interlineal graph

%Multiples plots in the same windows
hold on
y=sin(x);
plot(x,y,'b');
legend('sine','cos');
hold off
shg;

%%%%
%%%%Missing Data
%%%%

x1=[1,2,3,4,5,6,7,8]
x2=[1,2,3,4,NaN,6,7,8]
x3=[1,2,3,4,missing,6,7,8]
plot(x2)
max(x2)
min(x2)

mean(x1)
mean(x2)
var(x2)
std(x2)

%location of the missing value
isnan(x2)
ismissing(x2)

%fill missing value of x2
y=fillmissing(x2,'constant',1)

%remove missing value of x2
y=rmmissing(x2)

%%%%
%%%%Write and READ to file
%%%%

f=20;
ts=1/100;
T=3;
t=0:ts:T;
y=sin(2*pi*f*t);
plot(t,y);

%In plot Data is store in variable y. Array of 201 elements.
%Save it

csvwrite('_simple_signal.txt',y);

%Read from file
clear all
clc

%multiples formats
signal= load('_simple_signal.txt');
%only comma separated
signal= csvread('_simple_signal.txt');
plot(signal);






