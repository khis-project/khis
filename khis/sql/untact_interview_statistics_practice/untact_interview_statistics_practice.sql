CREATE TABLE "zoom" (
	"zoom_no"	number		NULL,
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"api_key"	varchar2(100)		NULL,
	"api_secret"	varchar2(100)		NULL,
	"jwt_token"	varchar2(1000)		NULL
);

COMMENT ON COLUMN "zoom"."zoom_no" IS '줌 번호';

COMMENT ON COLUMN "zoom"."MEMBER_NO" IS '회원번호(sequence)';

COMMENT ON COLUMN "zoom"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "zoom"."api_key" IS '줌 zpi kwy';

COMMENT ON COLUMN "zoom"."api_secret" IS '줌 api secret';

COMMENT ON COLUMN "zoom"."jwt_token" IS 'zoom jwt token';

CREATE TABLE "회원" (
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"PASSWORD"	VARCHAR2(250)		NULL,
	"NAME"	VARCHAR2(40)		NULL,
	"BIRTHDAY"	DATE		NULL,
	"EMAIL"	VARCHAR2(40)		NULL,
	"PHONE"	VARCHAR2(20)		NULL,
	"ADDRESS"	VARCHAR2(200)		NULL,
	"GENDER"	VARCHAR2(2)		NULL,
	"KIND"	VARCHAR2(20)		NULL,
	"JOIN_DATE"	DATE		NULL,
	"ID"	VARCHAR2(40)		NOT NULL,
	"INTERVIEW_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "회원"."MEMBER_NO" IS '회원번호(sequence)';

COMMENT ON COLUMN "회원"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "회원"."PASSWORD" IS '비밀번호';

COMMENT ON COLUMN "회원"."NAME" IS '이름';

COMMENT ON COLUMN "회원"."BIRTHDAY" IS '생년월일';

COMMENT ON COLUMN "회원"."EMAIL" IS '이메일';

COMMENT ON COLUMN "회원"."PHONE" IS '휴대폰';

COMMENT ON COLUMN "회원"."ADDRESS" IS '주소';

COMMENT ON COLUMN "회원"."GENDER" IS '성별';

COMMENT ON COLUMN "회원"."KIND" IS '가입자 유형';

COMMENT ON COLUMN "회원"."JOIN_DATE" IS '가입 날짜';

COMMENT ON COLUMN "회원"."ID" IS '아이디';

COMMENT ON COLUMN "회원"."INTERVIEW_NO" IS '면접번호';

CREATE TABLE "IR_INFO(면접관/면접자정보)" (
	"MEMBER_INFO_NO"	number		NOT NULL,
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"INTERVIEW_NO"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(40)		NOT NULL,
	"EMAIL"	VARCHAR2(40)		NOT NULL,
	"PHONE"	VARCHAR2(20)		NOT NULL,
	"CATETORY"	CHAR(1)		NULL,
	"ROLE"	CHAR(1)		NOT NULL,
	"IR_PATH_CODE"	number		NOT NULL,
	"INTERVIEWER_INFO_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."MEMBER_INFO_NO" IS '회원 번호 (SEQ 적용 필요)';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."INTERVIEW_NO" IS '면접자 번호';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."NAME" IS '면접자 이름';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."EMAIL" IS '면접자 이메일';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."PHONE" IS '면접자 전화번호';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."CATETORY" IS '면접 방법 분류';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."ROLE" IS '면접자/면접관 분류';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."IR_PATH_CODE" IS '면접지원 경로 번호';

COMMENT ON COLUMN "IR_INFO(면접관/면접자정보)"."INTERVIEWER_INFO_NO" IS '면접자 정보 번호';

CREATE TABLE "면접질문" (
	"interview_NO"	number		NULL,
	"NO"	number		NOT NULL,
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"NAME"	VARCHAR2(40)		NOT NULL,
	"TITLE"	VARCHAR2(100)		NOT NULL,
	"CONTENT"	VARCHAR2(1000)		NULL,
	"REG_DATE"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "면접질문"."interview_NO" IS '질문 번호';

COMMENT ON COLUMN "면접질문"."NO" IS '회원 번호 (SEQ 적용 필요)';

COMMENT ON COLUMN "면접질문"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "면접질문"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "면접질문"."NAME" IS '작성자 이름';

COMMENT ON COLUMN "면접질문"."TITLE" IS '면접 질문 제목';

COMMENT ON COLUMN "면접질문"."REG_DATE" IS '작성일자';

CREATE TABLE "면접후기게시판" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"OCCUPATION_CODE"	NUMBER		NOT NULL,
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"RANK"	VARCHAR2(50)		NOT NULL,
	"EMPLOYMENT_TYPE"	VARCHAR2(50)		NOT NULL,
	"TITLE"	VARCHAR2(500)		NULL,
	"REG_DATE"	DATE		NULL,
	"INTERVIEW_DIFFICULTY"	VARCHAR2(30)		NULL,
	"INTERVIEW_PATH"	VARCHAR2(30)		NULL,
	"INTERVIEW_DATE"	DATE		NULL,
	"INTERVIEW_EXPERIENCE"	VARCHAR2(20)		NULL,
	"RECLUITMENT_METHOD"	VARCHAR2(50)		NULL,
	"ANNOUNCEMENT_TIME"	VARCHAR2(50)		NULL,
	"PASSCHECK"	CHAR(1)		NULL
);

COMMENT ON COLUMN "면접후기게시판"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "면접후기게시판"."OCCUPATION_CODE" IS '직종코드';

COMMENT ON COLUMN "면접후기게시판"."MEMBER_NO" IS '회원번호(sequence)';

COMMENT ON COLUMN "면접후기게시판"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "면접후기게시판"."RANK" IS '직급';

COMMENT ON COLUMN "면접후기게시판"."EMPLOYMENT_TYPE" IS '고용형태';

COMMENT ON COLUMN "면접후기게시판"."TITLE" IS '게시글 제목';

COMMENT ON COLUMN "면접후기게시판"."REG_DATE" IS '게시글 등록일자';

COMMENT ON COLUMN "면접후기게시판"."INTERVIEW_DIFFICULTY" IS '면접 난이도';

COMMENT ON COLUMN "면접후기게시판"."INTERVIEW_PATH" IS '면접경로';

COMMENT ON COLUMN "면접후기게시판"."INTERVIEW_DATE" IS '면접일자';

COMMENT ON COLUMN "면접후기게시판"."INTERVIEW_EXPERIENCE" IS '면접경험(긍정적/보통/부정적)';

COMMENT ON COLUMN "면접후기게시판"."RECLUITMENT_METHOD" IS '채용방식';

COMMENT ON COLUMN "면접후기게시판"."ANNOUNCEMENT_TIME" IS '발표시기';

COMMENT ON COLUMN "면접후기게시판"."PASSCHECK" IS '합격여부';

CREATE TABLE "회사" (
	"CO_CODE"	NUMBER		NOT NULL,
	"CO_NAME"	VARCHAR(50)		NULL
);

COMMENT ON COLUMN "회사"."CO_CODE" IS '회사코드(sequence)';

COMMENT ON COLUMN "회사"."CO_NAME" IS '회사명';

CREATE TABLE "직종" (
	"OCCUPATION_CODE"	NUMBER		NOT NULL,
	"OCCUPATION_NAME"	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN "직종"."OCCUPATION_CODE" IS '직종코드';

COMMENT ON COLUMN "직종"."OCCUPATION_NAME" IS '직종이름';

CREATE TABLE "평가" (
	"evaluate_NO"	number		NOT NULL,
	"interview_NO"	number		NULL,
	"NO"	number		NOT NULL,
	"MEMBER_NO"	number		NOT NULL,
	"VALUE"	NUMBER		NULL,
	"COMMENT"	VARCHAR2(2000)		NULL
);

COMMENT ON COLUMN "평가"."evaluate_NO" IS '평가 번호';

COMMENT ON COLUMN "평가"."interview_NO" IS '질문 번호';

COMMENT ON COLUMN "평가"."NO" IS '회원 번호 (SEQ 적용 필요)';

COMMENT ON COLUMN "평가"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "평가"."VALUE" IS '면접 평가 값';

COMMENT ON COLUMN "평가"."COMMENT" IS '면접에 대한 평가자의 코멘트';

CREATE TABLE "면접후기질문" (
	"Question_no"	number		NOT NULL,
	"INTERVIEW_QUESTION"	varchar2(1000)		NULL,
	"INTERVIEW_ANSWER"	varchar2(4000)		NULL
);

COMMENT ON COLUMN "면접후기질문"."Question_no" IS '질문번호';

COMMENT ON COLUMN "면접후기질문"."INTERVIEW_QUESTION" IS '면접 질문';

COMMENT ON COLUMN "면접후기질문"."INTERVIEW_ANSWER" IS '면접 답변(느낀점)';

CREATE TABLE "면접시간" (
	"ITIME_NO"	number		NOT NULL,
	"MEMBER_INFO_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"start_time"	sysdate		NULL,
	"end_titme"	sysdate		NULL,
	"job_posting_NAME"	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN "면접시간"."ITIME_NO" IS '면접시간번호';

COMMENT ON COLUMN "면접시간"."MEMBER_INFO_NO" IS '회원번호';

COMMENT ON COLUMN "면접시간"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "면접시간"."start_time" IS '면접시작시간';

COMMENT ON COLUMN "면접시간"."end_titme" IS '면접종료시간';

COMMENT ON COLUMN "면접시간"."job_posting_NAME" IS '채용공고이름';

CREATE TABLE "면접후기게시판-질문" (
	"BOARD_NO"	NUMBER		NOT NULL,
	"Question_no"	number		NOT NULL
);

COMMENT ON COLUMN "면접후기게시판-질문"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "면접후기게시판-질문"."Question_no" IS '질문번호';

CREATE TABLE "회사 점수" (
	"COMPANY_SCORE_NO"	number		NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"SCORE"	number		NULL
);

COMMENT ON COLUMN "회사 점수"."COMPANY_SCORE_NO" IS '회사 점수 번호';

COMMENT ON COLUMN "회사 점수"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "회사 점수"."MEMBER_NO" IS '회원번호(sequence)';

COMMENT ON COLUMN "회사 점수"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "회사 점수"."SCORE" IS '회사 점수';

CREATE TABLE "면접 지원 경로 코드" (
	"IR_PATH_CODE"	number		NOT NULL,
	"IR_PATH_NAME"	varchar2(100)		NULL
);

COMMENT ON COLUMN "면접 지원 경로 코드"."IR_PATH_CODE" IS '면접지원 경로 번호';

COMMENT ON COLUMN "면접 지원 경로 코드"."IR_PATH_NAME" IS '면접 지원 경로명';

CREATE TABLE "탈퇴회원" (
	"MEMBER_NO"	number		NOT NULL,
	"PASSWORD"	VARCHAR2(250)		NULL,
	"NAME"	VARCHAR2(40)		NULL,
	"BIRTHDAY"	DATE		NULL,
	"EMAIL"	VARCHAR2(40)		NULL,
	"PHONE"	VARCHAR2(20)		NULL,
	"ADDRESS"	VARCHAR2(200)		NULL,
	"GENDER"	VARCHAR2(2)		NULL,
	"KIND"	VARCHAR2(20)		NULL,
	"JOIN_DATE"	DATE		NULL,
	"ID"	VARCHAR2(40)		NOT NULL,
	"INTERVIEW_NO"	NUMBER		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "탈퇴회원"."MEMBER_NO" IS '회원번호(sequence)';

COMMENT ON COLUMN "탈퇴회원"."PASSWORD" IS '비밀번호';

COMMENT ON COLUMN "탈퇴회원"."NAME" IS '이름';

COMMENT ON COLUMN "탈퇴회원"."BIRTHDAY" IS '생년월일';

COMMENT ON COLUMN "탈퇴회원"."EMAIL" IS '이메일';

COMMENT ON COLUMN "탈퇴회원"."PHONE" IS '휴대폰';

COMMENT ON COLUMN "탈퇴회원"."ADDRESS" IS '주소';

COMMENT ON COLUMN "탈퇴회원"."GENDER" IS '성별';

COMMENT ON COLUMN "탈퇴회원"."KIND" IS '가입자 유형';

COMMENT ON COLUMN "탈퇴회원"."JOIN_DATE" IS '가입 날짜';

COMMENT ON COLUMN "탈퇴회원"."ID" IS '아이디';

COMMENT ON COLUMN "탈퇴회원"."INTERVIEW_NO" IS '면접번호';

COMMENT ON COLUMN "탈퇴회원"."CO_CODE" IS '회사코드';

CREATE TABLE "면접자 이력서" (
	"INTERVIEWER_INFO_NO"	NUMBER		NULL,
	"self_introduction"	VARCHAR2(2000)		NULL,
	"image"	varchar2(200)		NULL
);

COMMENT ON COLUMN "면접자 이력서"."INTERVIEWER_INFO_NO" IS '면접자 정보 번호';

COMMENT ON COLUMN "면접자 이력서"."self_introduction" IS '자기소개서';

COMMENT ON COLUMN "면접자 이력서"."image" IS '면접자 사진';

CREATE TABLE "자격증" (
	"certificate_NO"	NUMBER		NULL,
	"certificate_NAME"	VARCHAR2(100)		NULL,
	"certificate_issuer"	VARCHAR2(100)		NULL,
	"certificate_DATE"	SYSDATE		NULL
);

COMMENT ON COLUMN "자격증"."certificate_NO" IS '자격증 번호';

COMMENT ON COLUMN "자격증"."certificate_NAME" IS '자격증 이름';

COMMENT ON COLUMN "자격증"."certificate_issuer" IS '자격증 발행처';

COMMENT ON COLUMN "자격증"."certificate_DATE" IS '자격증 발행 날짜';

CREATE TABLE "면접자이력서-자격증" (
	"certificate_NO"	NUMBER		NULL,
	"INTERVIEWER_INFO_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "면접자이력서-자격증"."certificate_NO" IS '자격증 번호';

COMMENT ON COLUMN "면접자이력서-자격증"."INTERVIEWER_INFO_NO" IS '면접자 정보 번호';

CREATE TABLE "경력" (
	"career_NO"	NUMBER		NOT NULL,
	"company_NAME"	VARCHAR2(100)		NULL,
	"CAREER_ term"	NUMBER		NULL,
	"CAREER_START_TIME"	SYSDATE		NULL,
	"CAREER_END_TIME"	SYSDATE		NULL
);

COMMENT ON COLUMN "경력"."career_NO" IS '경력 번호';

COMMENT ON COLUMN "경력"."company_NAME" IS '회사 이름';

COMMENT ON COLUMN "경력"."CAREER_ term" IS '경력 기간';

COMMENT ON COLUMN "경력"."CAREER_START_TIME" IS '활동시작일';

COMMENT ON COLUMN "경력"."CAREER_END_TIME" IS '활동 종료일';

CREATE TABLE "면접자이력서-경력" (
	"career_NO"	NUMBER		NOT NULL,
	"INTERVIEWER_INFO_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "면접자이력서-경력"."career_NO" IS '경력 번호';

COMMENT ON COLUMN "면접자이력서-경력"."INTERVIEWER_INFO_NO" IS '면접자 정보 번호';

CREATE TABLE "합격여부확인" (
	"Comment_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"interview_NO"	number		NULL,
	"PASSCHECK"	char(1)		NULL
);

COMMENT ON COLUMN "합격여부확인"."Comment_NO" IS '합격여부번호';

COMMENT ON COLUMN "합격여부확인"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "합격여부확인"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "합격여부확인"."interview_NO" IS '질문';

COMMENT ON COLUMN "합격여부확인"."PASSCHECK" IS '면접합격여부';

CREATE TABLE "합격여부" (
	"Comment_NO"	number		NOT NULL,
	"MEMBER_INFO_NO"	number		NOT NULL,
	"MEMBER_NO"	number		NOT NULL,
	"CO_CODE"	NUMBER		NOT NULL,
	"PASSCHECK"	char(1)		NULL
);

COMMENT ON COLUMN "합격여부"."Comment_NO" IS '합격여부확인';

COMMENT ON COLUMN "합격여부"."MEMBER_INFO_NO" IS '회원 번호 (SEQ 적용 필요)';

COMMENT ON COLUMN "합격여부"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "합격여부"."CO_CODE" IS '회사코드';

COMMENT ON COLUMN "합격여부"."PASSCHECK" IS '면접합격여부';

ALTER TABLE "zoom" ADD CONSTRAINT "PK_ZOOM" PRIMARY KEY (
	"zoom_no",
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "회원" ADD CONSTRAINT "PK_회원" PRIMARY KEY (
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "IR_INFO(면접관/면접자정보)" ADD CONSTRAINT "PK_IR_INFO(면접관/면접자정보)" PRIMARY KEY (
	"MEMBER_INFO_NO",
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "면접질문" ADD CONSTRAINT "PK_면접질문" PRIMARY KEY (
	"interview_NO",
	"NO",
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "면접후기게시판" ADD CONSTRAINT "PK_면접후기게시판" PRIMARY KEY (
	"BOARD_NO",
	"OCCUPATION_CODE",
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "회사" ADD CONSTRAINT "PK_회사" PRIMARY KEY (
	"CO_CODE"
);

ALTER TABLE "직종" ADD CONSTRAINT "PK_직종" PRIMARY KEY (
	"OCCUPATION_CODE"
);

ALTER TABLE "평가" ADD CONSTRAINT "PK_평가" PRIMARY KEY (
	"evaluate_NO",
	"interview_NO",
	"NO",
	"MEMBER_NO"
);

ALTER TABLE "면접후기질문" ADD CONSTRAINT "PK_면접후기질문" PRIMARY KEY (
	"Question_no"
);

ALTER TABLE "면접시간" ADD CONSTRAINT "PK_면접시간" PRIMARY KEY (
	"ITIME_NO",
	"MEMBER_INFO_NO",
	"CO_CODE"
);

ALTER TABLE "면접후기게시판-질문" ADD CONSTRAINT "PK_면접후기게시판-질문" PRIMARY KEY (
	"BOARD_NO",
	"Question_no"
);

ALTER TABLE "회사 점수" ADD CONSTRAINT "PK_회사 점수" PRIMARY KEY (
	"COMPANY_SCORE_NO",
	"BOARD_NO",
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "면접 지원 경로 코드" ADD CONSTRAINT "PK_면접 지원 경로 코드" PRIMARY KEY (
	"IR_PATH_CODE"
);

ALTER TABLE "탈퇴회원" ADD CONSTRAINT "PK_탈퇴회원" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "면접자 이력서" ADD CONSTRAINT "PK_면접자 이력서" PRIMARY KEY (
	"INTERVIEWER_INFO_NO"
);

ALTER TABLE "자격증" ADD CONSTRAINT "PK_자격증" PRIMARY KEY (
	"certificate_NO"
);

ALTER TABLE "면접자이력서-자격증" ADD CONSTRAINT "PK_면접자이력서-자격증" PRIMARY KEY (
	"certificate_NO",
	"INTERVIEWER_INFO_NO"
);

ALTER TABLE "경력" ADD CONSTRAINT "PK_경력" PRIMARY KEY (
	"career_NO"
);

ALTER TABLE "면접자이력서-경력" ADD CONSTRAINT "PK_면접자이력서-경력" PRIMARY KEY (
	"career_NO"
);

ALTER TABLE "합격여부확인" ADD CONSTRAINT "PK_합격여부확인" PRIMARY KEY (
	"Comment_NO",
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "합격여부" ADD CONSTRAINT "PK_합격여부" PRIMARY KEY (
	"Comment_NO",
	"MEMBER_INFO_NO",
	"MEMBER_NO",
	"CO_CODE"
);

ALTER TABLE "zoom" ADD CONSTRAINT "FK_회원_TO_zoom_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "회원" (
	"MEMBER_NO"
);

ALTER TABLE "zoom" ADD CONSTRAINT "FK_회원_TO_zoom_2" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "회원" (
	"CO_CODE"
);

ALTER TABLE "회원" ADD CONSTRAINT "FK_회사_TO_회원_1" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "회사" (
	"CO_CODE"
);

ALTER TABLE "IR_INFO(면접관/면접자정보)" ADD CONSTRAINT "FK_회원_TO_IR_INFO(면접관/면접자정보)_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "회원" (
	"MEMBER_NO"
);

ALTER TABLE "IR_INFO(면접관/면접자정보)" ADD CONSTRAINT "FK_회원_TO_IR_INFO(면접관/면접자정보)_2" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "회원" (
	"CO_CODE"
);

ALTER TABLE "면접질문" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_면접질문_1" FOREIGN KEY (
	"NO"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"MEMBER_INFO_NO"
);

ALTER TABLE "면접질문" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_면접질문_2" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"MEMBER_NO"
);

ALTER TABLE "면접질문" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_면접질문_3" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"CO_CODE"
);

ALTER TABLE "면접후기게시판" ADD CONSTRAINT "FK_직종_TO_면접후기게시판_1" FOREIGN KEY (
	"OCCUPATION_CODE"
)
REFERENCES "직종" (
	"OCCUPATION_CODE"
);

ALTER TABLE "면접후기게시판" ADD CONSTRAINT "FK_회원_TO_면접후기게시판_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "회원" (
	"MEMBER_NO"
);

ALTER TABLE "면접후기게시판" ADD CONSTRAINT "FK_회원_TO_면접후기게시판_2" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "회원" (
	"CO_CODE"
);

ALTER TABLE "평가" ADD CONSTRAINT "FK_면접질문_TO_평가_1" FOREIGN KEY (
	"interview_NO"
)
REFERENCES "면접질문" (
	"interview_NO"
);

ALTER TABLE "평가" ADD CONSTRAINT "FK_면접질문_TO_평가_2" FOREIGN KEY (
	"NO"
)
REFERENCES "면접질문" (
	"NO"
);

ALTER TABLE "평가" ADD CONSTRAINT "FK_면접질문_TO_평가_3" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "면접질문" (
	"MEMBER_NO"
);

ALTER TABLE "면접시간" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_면접시간_1" FOREIGN KEY (
	"MEMBER_INFO_NO"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"MEMBER_NO"
);

ALTER TABLE "면접시간" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_면접시간_2" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"CO_CODE"
);

ALTER TABLE "면접후기게시판-질문" ADD CONSTRAINT "FK_면접후기게시판_TO_면접후기게시판-질문_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "면접후기게시판" (
	"BOARD_NO"
);

ALTER TABLE "면접후기게시판-질문" ADD CONSTRAINT "FK_면접후기질문_TO_면접후기게시판-질문_1" FOREIGN KEY (
	"Question_no"
)
REFERENCES "면접후기질문" (
	"Question_no"
);

ALTER TABLE "회사 점수" ADD CONSTRAINT "FK_면접후기게시판_TO_회사 점수_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "면접후기게시판" (
	"BOARD_NO"
);

ALTER TABLE "회사 점수" ADD CONSTRAINT "FK_면접후기게시판_TO_회사 점수_2" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "면접후기게시판" (
	"MEMBER_NO"
);

ALTER TABLE "회사 점수" ADD CONSTRAINT "FK_면접후기게시판_TO_회사 점수_3" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "면접후기게시판" (
	"CO_CODE"
);

ALTER TABLE "면접자이력서-자격증" ADD CONSTRAINT "FK_자격증_TO_면접자이력서-자격증_1" FOREIGN KEY (
	"certificate_NO"
)
REFERENCES "자격증" (
	"certificate_NO"
);

ALTER TABLE "면접자이력서-자격증" ADD CONSTRAINT "FK_면접자 이력서_TO_면접자이력서-자격증_1" FOREIGN KEY (
	"INTERVIEWER_INFO_NO"
)
REFERENCES "면접자 이력서" (
	"INTERVIEWER_INFO_NO"
);

ALTER TABLE "면접자이력서-경력" ADD CONSTRAINT "FK_경력_TO_면접자이력서-경력_1" FOREIGN KEY (
	"career_NO"
)
REFERENCES "경력" (
	"career_NO"
);

ALTER TABLE "합격여부" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_합격여부_1" FOREIGN KEY (
	"MEMBER_INFO_NO"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"MEMBER_INFO_NO"
);

ALTER TABLE "합격여부" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_합격여부_2" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"MEMBER_NO"
);

ALTER TABLE "합격여부" ADD CONSTRAINT "FK_IR_INFO(면접관/면접자정보)_TO_합격여부_3" FOREIGN KEY (
	"CO_CODE"
)
REFERENCES "IR_INFO(면접관/면접자정보)" (
	"CO_CODE"
);

