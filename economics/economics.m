priceMin = 50;
priceMax = 100;
initSupplyMin = 1000;
initSupplyMax = 3000;
initDemandMin = 5000;
initDemandMax = 900;

N = 1000;
price = linspace(priceMin, priceMax, N);
initSupply = linspace(initSupplyMin, initSupplyMax, N);
initDemand = linspace(initDemandMin, initDemandMax, N);

supplyShift = -400;
demandShift = -200;

S1 = initSupply + supplyShift;
D1 = initDemand + demandShift;


lineWidth = 2;
initSupplyColor = "r";
initDemandColor = "b";
supplyColor = "r--";
demandColor = "b--";

intersection = find(initSupply == initDemand);
slopeS1 =  (price(end) - price(1)) / (initSupply(end) - initSupply(1));
slopeS2 = (price(end) - price(1)) / (S1(end) - S1(1));
slopeD1 = (price(end) - price(1)) / (initDemand(end) - initDemand(1));
slopeD2 = (price(end) - price(1)) / (D1(end) - D1(1));
EQ1 = (slopeS1*initSupplyMin - slopeD1*initDemandMin) / (slopeS1 - slopeD1);
priceEQ1 = priceMin + slopeS1*(EQ1 - initSupplyMin);
EQ2 = (slopeS2*S1(1) - slopeD2*D1(1)) / (slopeS2 - slopeD2);
priceEQ2 = priceMin + slopeS2*(EQ2 - S1(1));
disp(EQ1);
disp(EQ2);
disp(priceEQ1);
disp(priceEQ2);

hold on
xlabel("Quantity of Product");
ylabel("Price of Product");
plot(initSupply, price, initSupplyColor, "LineWidth", lineWidth, "DisplayName", "initSupply");
plot(initDemand, price, initDemandColor, "LineWidth", lineWidth, "DisplayName", "initDemand");
plot(EQ1, priceEQ1,'k*',"DisplayName", "EQ1");
 
plot(S1, price, supplyColor, "DisplayName", "finalSupply");
plot(D1, price, demandColor, "DisplayName", "finalDemand");
plot(EQ2, priceEQ2,'k*',"DisplayName", "EQ2");
 
legend;
hold off