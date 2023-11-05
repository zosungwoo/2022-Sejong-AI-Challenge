# 2022-Sejong-AI-Challenge

인공 지능 분야 문제 해결 능력 경진대회

<br>

### 통신사 고객 이탈 여부 예측 문제

&nbsp; 통신 회사의 경우 신규 고객을 유치하는 동시에 수익 창출 기반을 늘리기 위해 계약 해지(=이탈)을 피하는 것이 중요합니다. 신규 고객이 이탈하는 이유를 살펴보면 더 나은 가격, 더 흥미로운 패키지, 불편한 서비스 경험 또는 고객의 개인적인 상황 변화와 같이 다양한 이유로 고객이 계약을 종료하게 됩니다. 고객 이탈 분 석은 고객 이탈을 예측하고 이탈을 유발하는 근본적인 이유를 정의하는 기능을 제공합니다. 통신사는 인공지능 모델을 적용하여 개별 고객을 기준으로 이탈을 예측하고 할인, 특별제안 또는 기타 만족을 주기 위한 대 응 조치를 취하여 고객을 유지할 수 있습니다. 여러분은 지금부터 <인공지능 기술>을 활용 하여, test.csv 파일로 제공된 통신사 고객들의 이탈 여부를 예측하는 인공지능 SW를 작성해주길 바란다.

> #### 학습 데이터로는 (통신사 고객 정보)와 (최종 이탈 여부)를 함께 제공한다.
> 1. index : 통신사 고객 순번
> 2. Unnamed: 0 : 알수 없음
> 3. custumerID : 통신사 고객 아이디 (xxxx-xxxxx)
> 4. gender : 성별 (Male, Female)
> 5. SeniorCitizen : 고령자 여부 (0, 1)
> 6. Partner : 파트너 여부 (Yes, No)
> 7. Dependents: 부양가족 여부 (Yes, No)
> 8. tenure: 계약유지기간 (0~72)
> 9. PhoneService : 폰서비스 여부 (Yes, No)
> 10. MultipleLines : 여러가인가입 여부 (Yes, No)
> 11. InternetService : 인터넷공급망종류 (Fiber optic, DSL, 등)
> 12. OnlineSecurity : 온라인 보안 여부 (Yes, No, 등)
> 13. OnlineBackup : 온라인 백업 여부 (Yes, No, 등)
> 14. DeviceProtection : 장비 보험 여부 (Yes, No, 등)
> 15. TechSupport : 기술 지원 여부 (Yes, No, 등)
> 16. StreamingTV : TV스트리밍 여부 (Yes, No, 등)
> 17. StreamingMovies: 영화스트리밍 (Yes, No, 등)
> 18. Contract : 계약형태 (Month to Month, Two year, 등)
> 19. PaperlessBilling : 전자 고지서 여부 (Yes, No)
> 20. PaymentMethod : 지불 방식 (Electronic check, Mailed check, 등)
> 21. MonthlyCharges : 월청구 액
> 22. TotalCharges : 전체기간청구액
> 23. Churn : 최종 이탈 여부 (Yes, No)


<br>

- **MATLAB 트랙** 참가: MATLAB만을 사용하여 문제 해결
- ****통신사 고객 이탈 여부 예측 문제**** 해결
- MATLAB을 활용해 데이터 불러오기, 간단한 EDA, 전처리, 모델링을 수행
