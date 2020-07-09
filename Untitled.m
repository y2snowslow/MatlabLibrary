clear all;

%Road Load RAV 4 EPA Data 
A=129.2875143;
B=0.074683351;
C=0.04648005;
INATIA_WEIGHT = 1702.125; %kg “™‰¿Šµ«d—Ê
TIRE_RADIUS = 724*10^-3/2;  %m  225/65R17
REDUCTION_RATIO = 12.1;


Speedtable = readtable('US06.xlsx');


% ‘äŒ`”÷•ª‚ÌÀ‘•
acceleration = get_accer(Speedtable.Speed_km_per_hour,1);

% ‘–s’ïR‚ÌZo
road_load = running_resistance(Speedtable.Speed_km_per_hour,A,B,C);
acceleration_resitance = INATIA_WEIGHT.*acceleration;
total_resistance = road_load + acceleration_resitance;

%N-T Map‚ÉŠ·Z
motor_torque = total_resistance*TIRE_RADIUS/REDUCTION_RATIO;
motor_rev_per_min  = Speedtable.Speed_km_per_hour.*(1000/3600)/(2*pi*TIRE_RADIUS)*60*REDUCTION_RATIO;

% figure(1)


[x,y,amount] = get_bubble_chirt_data(motor_rev_per_min,motor_torque,6);
bubble_chirt(x,y,amount,5);
plot(motor_rev_per_min,motor_torque);


function road_load = running_resistance(speed,A,B,C)
    road_load = A + speed.*B + speed.^2*C;
end


function acceleration = get_accer(speed,deltaT)
acceleration = zeros(length(speed),1);

acceleration(1) = 0;
acceleration(end) = 0;

for i = 2:length(speed)-1
    acceleration(i) =1/2*deltaT*(speed(i) - speed(i-1) + speed(i+1) - speed(i) )*1000/3600; %m/sec^2
end

end


function [x,y,amount] = get_bubble_chirt_data(xin,yin,divide_number)

xin_area = min(xin):(max(xin)-min(xin))/(divide_number-1):max(xin);
yin_area = min(yin):(max(yin)-min(yin))/(divide_number-1):max(yin);

data_count = 1;

for i = 1:length(xin_area)-1
    if i == length(xin_area)-1
        xin_are_pos = (xin >= xin_area(i)) & (xin <= xin_area(i+1));
    else
        xin_are_pos = (xin >= xin_area(i)) & (xin < xin_area(i+1));
    end
    for j = 1:length(yin_area)-1
        
        %‚±‚ê‚¾‚Æmax‚ªQÆ‚³‚ê‚È‚¢EEE—vC³
        if   j == length(yin_area)-1
            yin_are_pos = (yin >= yin_area(j)) & (yin <= yin_area(j+1));
        else
            yin_are_pos = (yin >= yin_area(j)) & (yin < yin_area(j+1));
        end
        
        data = sum(xin_are_pos & yin_are_pos);
        
        if data ~= 0
            x(data_count,1) = mean(xin(xin_are_pos));
            y(data_count,1) = mean(yin(yin_are_pos));
            amount(data_count,1) = sum(data);
            
            data_count = data_count + 1;
            
        else
            disp('Skip')
        end
    end
end


end
