# pureodaou
다우기술 인턴(2018/08/27 - 2018/09/21)

프로젝트 2조  (문제은행 웹 서비스)



팀명 : 풀어다우

개발환경 :

jdk 8 버전,
spring framework 4.*, 
MyBatis, 
maria Database, 
Tomcat 8.5





tomcat -> edit -> path: / 변경


## 관리자 기능

[김수호]

* 관리자페이지 -> 1) [문제관리], 2) [출제관리], 3) [기록관리]

1) [문제관리] - 문제 등록, 수정, 삭제
2) [출제관리] - 회차별 문제 출제 (직급별, 부서별, ox/객관식/주관식 갯수 지정, 시작/종료일자, 카테고리 지정 등), 엑셀다운로드  
3) [기록관리] - 시험을 응시한 사용자의 전체 기록관리 , 주관식 채점 기능, 엑셀다운로드 기능, 회차별/직급별 조회 기능



## 사용자 기능

[김지웅]

* 사용자페이지 -> 1) [시험보기], 2) [채점하기], 3) [오답노트]

1) [시험보기] - 등록된 문제를 정해진 개수 만큼 무작위 선별, 시험 저장/출력(시간제한-타이머기능)
2) [채점하기] - 저장된 시험에 응시한 후 답안을 제출 -> OX, 객관식 자동채점 -> 관리자에서 주관식 채점
3) [오답노트] - 응시한 시험에 대한 결과,목록을 조회하고 채점이 완료된 회차에 한해 오답노트 조회
