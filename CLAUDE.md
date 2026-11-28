# realestate

## 프로젝트의 목적
- 데이터엔지니어 이직을 위한 포트폴리오 제작

## 기술스택
- Terraform, Docker, AWS - EC2, S3, Airflow, Grafana - Prometheus, PostgreSql

## 프로젝트 구조
- docker/: 도커관련 파일
- terraform/: 테라폼 관련 파일
- documents/: 프로젝트 관련 문서

## 데이터 흐름
- 부동산실거래가 공공데이터 API를 호출하여 원천데이터 수집
- 수집한 데이터를 PARQUET로 변환하여 S3에 저장
- S3를 읽어서 PostgreSql에 SoT를 생성(Airflow 메타데이터 저장 PostgreSql과는 별개의 DB)
- 전반적인 데이터 수집과정은 Airflow로 제어
- Prometheus를 이용하여 모니터링
  - EC2 메모리, 저장소 사용량
  - Airflow Task
- 아키텍처 위치 documents/architecture.drawio

## 작업방식
- 학습을 병행하는 중으로 코드를 직접 수정하지 말것
- 질문에 설명을 하며, 구체적인 코드는 제시하지 말것
- 질문 및 리뷰 시 모호한 점은 사실대로 모호하다고 답변할것
- 예시를 보여달라고 요청시 예시 코드를 보여줄것
- 리뷰 시 기존 코드 인용은 허용