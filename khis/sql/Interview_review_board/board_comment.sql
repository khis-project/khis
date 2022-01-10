-- 면접후기 댓글 테이블 생성(+BOARD_NO 왜래키 적용)
CREATE TABLE  BOARD_COMMENT  (
	 COMMENT_NO NUMBER NOT NULL,
      BOARD_NO NUMBER NOT NULL,
	 WRITER_NO NUMBER NOT NULL,
	 COMMENT_SECRET_YN VARCHAR2(1) NULL,
	 COMMENT_DATE DATE NULL,
	 COMMENT_DELETE_YN VARCHAR2(1) NULL,
	 COMMENT_CONTENT VARCHAR2(1000) NULL,
      CONSTRAINT FK_BOARD_NO FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO)
);

-- 면접후기 댓글 테이블 생성(+BOARD_NO 왜래키 적용)
CREATE TABLE  BOARD_COMMENT  (
	 COMMENT_NO NUMBER NOT NULL,
      BOARD_NO NUMBER NOT NULL,
	 WRITER_NO NUMBER NOT NULL,
	 COMMENT_SECRET_YN VARCHAR2(1) NULL,
	 COMMENT_DATE DATE NULL,
	 COMMENT_DELETE_YN VARCHAR2(1) NULL,
	 COMMENT_CONTENT VARCHAR2(1000) NULL,
      CONSTRAINT FK_BOARD_NO FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO)
);

-- 면접후기 댓글 컬럼 코멘트 작성
    COMMENT ON COLUMN BOARD_COMMENT.COMMENT_NO IS '댓글 번호';
    COMMENT ON COLUMN BOARD_COMMENT.BOARD_NO IS '게시글 번호';
    COMMENT ON COLUMN BOARD_COMMENT.WRITER_NO IS '댓글 작성자';
    COMMENT ON COLUMN BOARD_COMMENT.COMMENT_SECRET_YN IS '비밀 댓글 여부';
    COMMENT ON COLUMN BOARD_COMMENT.COMMENT_DATE IS '댓글 작성 시간';
    COMMENT ON COLUMN BOARD_COMMENT.COMMENT_DELETE_YN IS '댓글 삭제 여부';
    COMMENT ON COLUMN BOARD_COMMENT.COMMENT_CONTENT IS '댓글 내용';
	 
-- 면접후기 댓글(COMMENT_NO) 시퀀스 적용
CREATE SEQUENCE SEQ_COMMENT_NO;


-- COMMENT_SECRET_YN & COMMENT_DELETE_YN DDEFAULT 값 설정
ALTER TABLE BOARD_COMMENT MODIFY COMMENT_SECRET_YN DEFAULT 'n';
ALTER TABLE BOARD_COMMENT MODIFY COMMENT_DELETE_YN DEFAULT 'n';


--COMMENT_NO PK 적용 
ALTER TABLE BOARD_COMMENT ADD PRIMARY KEY(COMMENT_NO);
ALTER TABLE BOARD_COMMENT RENAME CONSTRAINT PK_BOARD_COMMENT TO PK_COMMENT_NO;
ALTER INDEX SYS_C0017703 RENAME TO PK_COMMENT_NO;


--COMMENT_DELETE_YN 컬럼 삭제
ALTER TABLE BOARD_COMMENT DROP COLUMN COMMENT_DELETE_YN;