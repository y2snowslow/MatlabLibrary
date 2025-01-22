
% loss
OutTanshi_loss = 94.5;
tanshidai_loss = 514.1;
module_loss = 426.1;
cap_loss = 194.3;
PDC_loss = 16.7;
jyouge_loss = 51.3;
EMI_loss = 147.1;
PN_loss = 22.3;

%Temp
PN_temp_init = 82;
case_temp_init = 75;
air_temp_init = 75;

%各種熱抵抗
% tanshidai_OutTanshi_Rth=  ;
% tanshidai_module_Rth=  ;
% tanshidai_air_Rth=  ;
% tanshidai_case_Rth=  ;
% module_tanshidai_Rth=  ;
% module_module_Rth=  ;
% module_cap_Rth=  ;
% module_case_Rth=  ;
% cap_module_Rth=  ;
% cap_PDC_Rth=  ;
% cap_air_Rth=  ;
% cap_case_Rth=  ;
% PDC_cap_Rth=  ;
% PDC_jyouge_Rth=  ;
% PDC_air_Rth=  ;
% PDC_case_Rth=  ;
% jyouge_PDC_Rth=  ;
% jyouge_EMI_Rth=  ;
% jyouge_air_Rth=  ;
% jyouge_case_Rth=  ;
% EMI_jyouge_Rth=  ;
% EMI_PN_Rth=  ;
% EMI_air_Rth=  ;
% EMI_case_Rth=  ;
% PN_EMI_Rth=  ;
% PN_in_Rth=  ;
% PN_air_Rth=  ;
% PN_case_Rth=  ;


%Sim & Analysis
sim("thermal_analysis.slx");


