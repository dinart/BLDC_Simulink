%%Simulação de um motor BLDC no Simulink
modelo = 'BLDC_CTRL_MODELO.slx'

%Parametros do Motor
polos=4;
Vcc=160;
Kb=0.10476;
L=0.00272;
M=-0.0015;
R=0.7;
J=0.0002;
B=0.002;

%Parametros do Controlador
%PID
sintonia =1;  %1= Sintonia Fina, 0 = Ziegler Nichols
if sintonia
    kp=0.006;
    ki=1;
    kd = 4.5e-6;
    N=20000;
else
    kp=0.0016
    ki=0.3086;
    kd=0.000002;
    N=2000;
end

%FF
Kff_w=4.65e-5;

%Limitador de Corrente
Lim_Corrente = 12;
StartupT = 0.2;


open_system(modelo)

%Para recuperar uma variável, utilizar o "Simulation Data Inspector", todos
%os sinais relevante estão marcados para monitoração.