clc, clear, close all;

i_accion = [];
% j = 1
% for i = 0 : 100
%     Mag_pulso_corriente = 1e-6*(i /10 + 1);
%     [t, X, Y] = sim("MEMBRANA_CALAMAR_GIGANTE_2B");
%     if( max(Y) > 0 )
%         i_accion(j) = Mag_pulso_corriente;
%         disp(["Corriente de acción en: ", Mag_pulso_corriente]);
%         j = j + 1;
%     end
% end

[t, X, Y] = sim("MEMBRANA_CALAMAR_GIGANTE_2B");
% i_accion

