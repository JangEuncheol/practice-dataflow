# realestate

## 프로젝트의 목적
- 데이터엔지니어 이직을 위한 포트폴리오 제작

## 기술스택
- Terraform, Docker, AWS - EC2, S3, Airflow, Grafana - Prometheus, PostgreSql

## 프로젝트 구조
- docker/: 도커관련 파일
  - pipeline/: 파이프라인 관련 도커파일
  - observability/: 시각화 관련 도커파일
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
- 비밀값은 로컬파일로 관리하며 원격저장소에 올라가지 않도록 할것

## 지식수준
- Terraform: 처음사용
- Docker: 사용해본적있으나 깊은 설정까지는 알지 못함
- Grafana, Prometheus: 사용해본적은 있으나 깊은 설정까지는 알지 못함
- AWS: 사용해본적있으나 깊은 설정까지는 알지 못함
- Python: 사용가능
- Airflow: 처음사용, 개념만 알고있음
- PostgreSql: Vertica DB를 3년 이상사용해서 기본적인 내용은 알고있을걸로 예상

## 설명방식
- 힌트를 먼저주고 정답은 요청할때만 제공
- 공식 문서 링크 함께 제공
- 왜 그렇게 해야하는 지 위주로 설명
- 실무 방식과 다르거나 일반적으로 사용하는 방식과 다르면 그 차이와 트레이드오프 알려줄 것
- 리뷰 시에는 문제 위치와 이유는 알려주고 해결 방법은 힌트로

## 커밋/브랜치
- 브랜치는 main, chore, feature로 나눌 것
- main: 메인 브랜치, chore, feature가 최종적으로 합쳐지는 브랜치
- chore: 문서생성, 지침 등 기능적인 작업 이외의 작업
- feature: 코드 작성 등의 기능적인 작업 브랜치
- 브랜치 이름: chore/1, feature/3과 같이 카테고리/이슈번호 브랜치 이름 작성
- 커밋 컨벤션: #1 [chore] something 와 같이 #이슈번호 [카테고리] 커밋내용 형식으로 작성
- 커밋, 푸시하라는 사용자의 명령에 따라 커밋 후 리모트에 PR 생성
- 사용자의 확인 후 컨플릭트가 없을 시 "머지해" 명령에 메인으로 머지
- 머지할 때 GitHub의 "Squash and merge" 사용, 머지 시 메시지는 커밋 컨벤션을 따름

## 실행금지 명령어
- terraform apply, destroy
- AWS CLI의 조회를 제외한 전체 명령어
- git push --force
- EC2에 원격접속하여 실행하는 명령어
- 프로젝트 폴더 밖의 경로에 대한 쓰기, 삭제에 대한 명령어
- Claude Code 메모리(~/.claude/projects/-Users-ethan-main-workspace-realestate/memory/)는 예외