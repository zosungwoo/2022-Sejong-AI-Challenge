traindata = readtable('train.csv')
testdata = readtable("test.csv")
%%
summary(traindata)
sum(ismissing(traindata))  % TotalCharges has nan
[n_train, ~] = size(traindata)
[n_test, ~] = size(traindata)
%%
head(traindata)
%%
traindata.index = []
traindata.Unnamed_0 = []
traindata.customerID = []  % 전체기간청구액/월 청구액으로 기간 계산하기 때문에 기간 데이터가 될수도 있는 ID 제거
testdata.index = []
testdata.Unnamed_0 = []
testdata.customerID = []
%%
summary(categorical(traindata.gender))
genders = categorical(grp2idx([traindata.gender; testdata.gender]))
traindata.gender = genders(1:n_train)
testdata.gender = genders(n_train+1:end)

%%
traindata.SeniorCitizen = categorical(traindata.SeniorCitizen)
testdata.SeniorCitizen = categorical(testdata.SeniorCitizen)
%%
summary(categorical(traindata.Partner))
summary(categorical(traindata.Dependents))

partners = categorical(grp2idx([traindata.Partner; testdata.Partner]))
traindata.Partner = partners(1:n_train)
testdata.Partner = partners(n_train+1:end)

dependents = categorical(grp2idx([traindata.Dependents; testdata.Dependents]))
traindata.Dependents = dependents(1:n_train)
testdata.Dependents = dependents(n_train+1:end)
%%
traindata.tenure = rescale(traindata.tenure, 0, 1)
testdata.tenure = rescale(testdata.tenure, 0, 1)
%%
% Rest of Binary Data (Yes or No or ...)

summary(categorical(traindata.PhoneService));
PhoneServices = categorical(grp2idx([traindata.PhoneService
testdata.PhoneService]));
traindata.PhoneService = PhoneServices(1:n_train);
testdata.PhoneService = PhoneServices(n_train+1:end);

summary(categorical(traindata.MultipleLines));
summary(categorical(testdata.MultipleLines))  % No phone service == No
traindata.MultipleLines = replace(traindata.MultipleLines, 'No phone service', 'No')
testdata.MultipleLines = replace(testdata.MultipleLines, 'No phone service', 'No')
MultipleLines2 = categorical(grp2idx([traindata.MultipleLines; testdata.MultipleLines]));
traindata.MultipleLines = MultipleLines2(1:n_train);
testdata.MultipleLines = MultipleLines2(n_train+1:end);

summary(categorical(traindata.InternetService));
InternetServices = categorical(grp2idx([traindata.InternetService; testdata.InternetService]));
traindata.InternetService = InternetServices(1:n_train);
testdata.InternetService = InternetServices(n_train+1:end);

% OnlineSecurity ~ StreamingMovies columns have 3 classes exactly (yes or no or no internet service).
% and I think these factors are also important.
% There is clearly different between 'No internet service' and 'No'
OnlineSecuritys = categorical(grp2idx([traindata.OnlineSecurity; testdata.OnlineSecurity]));
traindata.OnlineSecurity = OnlineSecuritys(1:n_train);
testdata.OnlineSecurity = OnlineSecuritys(n_train+1:end);

OnlineBackups = categorical(grp2idx([traindata.OnlineBackup; testdata.OnlineBackup]));
traindata.OnlineBackup = OnlineBackups(1:n_train);
testdata.OnlineBackup = OnlineBackups(n_train+1:end);

DeviceProtections = categorical(grp2idx([traindata.DeviceProtection; testdata.DeviceProtection]));
traindata.DeviceProtection = DeviceProtections(1:n_train);
testdata.DeviceProtection = DeviceProtections(n_train+1:end);

TechSupports = categorical(grp2idx([traindata.TechSupport; testdata.TechSupport]));
traindata.TechSupport = TechSupports(1:n_train);
testdata.TechSupport = TechSupports(n_train+1:end);

StreamingTVs = categorical(grp2idx([traindata.StreamingTV; testdata.StreamingTV]));
traindata.StreamingTV = StreamingTVs(1:n_train);
testdata.StreamingTV = StreamingTVs(n_train+1:end);

StreamingMovies2 = categorical(grp2idx([traindata.StreamingMovies; testdata.StreamingMovies]));
traindata.StreamingMovies = StreamingMovies2(1:n_train);
testdata.StreamingMovies = StreamingMovies2(n_train+1:end);
%%
summary(categorical(traindata.Contract));
Contracts = categorical(grp2idx([traindata.Contract; testdata.Contract]));
traindata.Contract = Contracts(1:n_train);
testdata.Contract = Contracts(n_train+1:end);

summary(categorical(traindata.PaperlessBilling));
PaperlessBillings = categorical(grp2idx([traindata.PaperlessBilling; testdata.PaperlessBilling]));
traindata.PaperlessBilling = PaperlessBillings(1:n_train);
testdata.PaperlessBilling = PaperlessBillings(n_train+1:end);

summary(categorical(traindata.PaymentMethod));
PaymentMethods = categorical(grp2idx([traindata.PaymentMethod; testdata.PaymentMethod]));
traindata.PaymentMethod = PaymentMethods(1:n_train);
testdata.PaymentMethod = PaymentMethods(n_train+1:end);
%%
summary(traindata);
%%
traindata(isnan(traindata.TotalCharges), :) = []
%%
traindata.charged = normalize(traindata.TotalCharges ./ traindata.MonthlyCharges);
testdata.charged = normalize(testdata.TotalCharges ./ testdata.MonthlyCharges);
%%
traindata.MonthlyCharges = normalize(traindata.MonthlyCharges);
testdata.MonthlyCharges = normalize(testdata.MonthlyCharges);
traindata.TotalCharges = normalize(traindata.TotalCharges);
testdata.TotalCharges = normalize(testdata.TotalCharges);
%%
model = fitcauto(traindata, 'Churn')
%%
output = predict(model, testdata)
output = replace(output, 'Yes', '1')
output = replace(output, 'No', '0')

%%
submission = readtable('submit_sample.csv');
submission.Churn = output
writetable(submission, 'submission.csv')