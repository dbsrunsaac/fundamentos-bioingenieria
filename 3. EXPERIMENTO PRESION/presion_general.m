clc, clear, close all;
delt = 0.001;
a = 7e-4;
b = 20;
c = 2.5;
d = 80;
tc = 0.264;
tp = 0.371;
tr = 0.299;
tb = 0.258;
alpha = 2.88;
Vv0 = 150; % Volumen Inicial

denom = ((1.-exp(-(tp/tc)^alpha))*exp(-((tp-tb)/tr)^alpha));
t(1) = 0;
Vv(1) = Vv0;
edp = a*((Vv0 -b))^2;
pdp = c*Vv0 -d ;
pp = pdp/denom;
t1 = 0;
t2 = 0;
e1 = exp(-(t1/tc)^alpha);
e2 = exp(-(t2/tr)^alpha);
pv0 = edp + pp*((1.-e1)*e2);

for i = 10:20:150
    denom = ((1.-exp(-(tp/tc)^alpha))*exp(-((tp-tb)/tr)^alpha));
    t(1) = 0;
    Vv(1) = i;
    edp = a*((i -b))^2;
    pdp = c*i -d ;
    pp = pdp/denom;
    t1 = 0;
    t2 = 0;
    e1 = exp(-(t1/tc)^alpha);
    e2 = exp(-(t2/tr)^alpha);
    pv0 = edp + pp*((1.-e1)*e2);
    for j = 2: 1000
        t(j) = t(j - 1) + delt;
        Vv(j) = Vv(j - 1);
        edp = a*((Vv(j) - b))^2;
        pdp = c*Vv(j) - d;
        pp = pdp/denom;
        t1 = t(j);

        t2 = t(j) - tb;
        if(t2 < 0)
            t2 = 0;
        end
        e1 = exp(-(t1/tc)^alpha);
        e2 = exp(-(t2/tr)^alpha);
        pv(j) = edp + pp*((1. - e1)*e2);
    end
    plot(t, pv);
    title("Presión Isovolumica Ventricular");
    xlabel("Time (s)");
    ylabel("Presion Ventricular Pv [mmHg]");
    hold on
    grid on
end




