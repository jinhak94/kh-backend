--------------------------------------------------------
--  파일이 생성됨 - 금요일-3월-12-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_BOARD_COMMENT
--------------------------------------------------------

   CREATE SEQUENCE  "FSS1234"."SEQ_BOARD_COMMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 16 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMMENT
--------------------------------------------------------

   CREATE SEQUENCE  "FSS1234"."SEQ_COMMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_IMAGESTORE_NO
--------------------------------------------------------

   CREATE SEQUENCE  "FSS1234"."SEQ_IMAGESTORE_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 511 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PLACE_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FSS1234"."SEQ_PLACE_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 253 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PLAY_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FSS1234"."SEQ_PLAY_ID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 235 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REG_ID
--------------------------------------------------------

   CREATE SEQUENCE  "FSS1234"."SEQ_REG_ID"  MINVALUE 10 MAXVALUE 99 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  CYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_REVIEW_BOARD_NO
--------------------------------------------------------

   CREATE SEQUENCE  "FSS1234"."SEQ_REVIEW_BOARD_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 30 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "FSS1234"."BOARD" 
   (	"BOARD_NO" NUMBER, 
	"BOARD_TITLE" VARCHAR2(200 BYTE), 
	"BOARD_WRITER" VARCHAR2(20 BYTE), 
	"BOARD_CONTENT" VARCHAR2(4000 BYTE), 
	"BOARD_ENROLL_DATE" DATE DEFAULT sysdate, 
	"BOARD_READ_COUNT" NUMBER DEFAULT 0, 
	"BOARD_ORIGINAL_FILENAME" VARCHAR2(200 BYTE), 
	"BOARD_RENAMED_FILENAME" VARCHAR2(200 BYTE), 
	"BOARD_CATEGORY" CHAR(1 BYTE), 
	"BOARD_DEL_FLAG" CHAR(1 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT
--------------------------------------------------------

  CREATE TABLE "FSS1234"."BOARD_COMMENT" 
   (	"BOARD_COMMENT_NO" NUMBER, 
	"BOARD_COMMENT_LEVEL" NUMBER DEFAULT 1, 
	"BOARD_COMMENT_CONTENT" VARCHAR2(2000 BYTE), 
	"BOARD_REF" NUMBER, 
	"BOARD_COMMENT_REF" NUMBER, 
	"BOARD_COMMENT_ENROLL_DATE" DATE DEFAULT sysdate, 
	"BOARD_COMMENT_CATEGORY" CHAR(1 BYTE), 
	"BOARD_COMMENT_DEL_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"BOARD_COMMENT_WRITER" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COMMENT_TABLE
--------------------------------------------------------

  CREATE TABLE "FSS1234"."COMMENT_TABLE" 
   (	"COMMENT_ID" NUMBER, 
	"COMMENT_LEVEL" NUMBER DEFAULT 1, 
	"COMMENT_CONTENT" VARCHAR2(2000 BYTE), 
	"PRODUCT_SCORE" NUMBER, 
	"PRODUCT_REF" NUMBER, 
	"COMMENT_REF" NUMBER, 
	"COMMENT_DATE" DATE DEFAULT sysdate, 
	"COMMENT_CATEGORY" CHAR(1 BYTE), 
	"COMMENT_DEL_FLAG" CHAR(1 BYTE), 
	"PLAY_ID" VARCHAR2(20 BYTE), 
	"PLACE_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table IMAGESTORE
--------------------------------------------------------

  CREATE TABLE "FSS1234"."IMAGESTORE" 
   (	"IMAGE_NO" NUMBER, 
	"ORIGINAL_FILENAME" VARCHAR2(200 BYTE), 
	"RENAMED_FILENAME" VARCHAR2(200 BYTE), 
	"PLAY_ID" VARCHAR2(20 BYTE), 
	"PLACE_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "FSS1234"."MEMBER" 
   (	"MEMBER_ID" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(300 BYTE), 
	"MEMBER_NAME" VARCHAR2(100 BYTE), 
	"PROFILE_ORIGINAL_FILE_NAME" VARCHAR2(200 BYTE), 
	"PROFILE_RENAMED_FILE_NAME" VARCHAR2(200 BYTE), 
	"MEMBER_PASSPORT" VARCHAR2(15 BYTE), 
	"PHONE" CHAR(11 BYTE), 
	"GENDER" CHAR(1 BYTE), 
	"BIRTH" DATE, 
	"MEMBER_ADDRESS" VARCHAR2(200 BYTE), 
	"MEMBER_EMAIL" VARCHAR2(200 BYTE), 
	"MEMBER_ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MEMBER_DEL_FLAG" CHAR(1 BYTE) DEFAULT 'N', 
	"MEMBER_ROLE" CHAR(1 BYTE) DEFAULT 'G'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PLACE
--------------------------------------------------------

  CREATE TABLE "FSS1234"."PLACE" 
   (	"PLACE_ID" VARCHAR2(20 BYTE), 
	"THUMBNAIL_ORIGINAL_FILENAME" VARCHAR2(200 BYTE), 
	"THUMBNAIL_RENAMED_FILENAME" VARCHAR2(200 BYTE), 
	"PLACE_NAME" VARCHAR2(100 BYTE), 
	"PLACE_SCORE" NUMBER DEFAULT 0, 
	"PLACE_LOC" VARCHAR2(50 BYTE), 
	"PLACE_ADDR" VARCHAR2(200 BYTE), 
	"PLACE_PRICE" NUMBER, 
	"PLACE_AVAIL_COUNT" NUMBER, 
	"PLACE_NOTE" VARCHAR2(1000 BYTE), 
	"PLACE_ROOM_COUNT" NUMBER, 
	"PLACE_FACILITY" VARCHAR2(150 BYTE), 
	"PLACE_DEL_FLAG" CHAR(1 BYTE) DEFAULT 'C', 
	"HOST_MEMBER_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PLAY
--------------------------------------------------------

  CREATE TABLE "FSS1234"."PLAY" 
   (	"PLAY_ID" VARCHAR2(20 BYTE), 
	"COMPANY" VARCHAR2(50 BYTE), 
	"THUMBNAIL_ORIGINAL_FILENAME" VARCHAR2(200 BYTE), 
	"THUMBNAIL_RENAMED_FILENAME" VARCHAR2(200 BYTE), 
	"PLAY_NAME" VARCHAR2(100 BYTE), 
	"PLAY_SCORE" NUMBER, 
	"PLAY_LOC" VARCHAR2(50 BYTE), 
	"PLAY_ADDR" VARCHAR2(200 BYTE), 
	"PLAY_PRICE" NUMBER, 
	"PLAY_TIME" NUMBER, 
	"PLAY_AVAIL_COUNT" NUMBER, 
	"PLAY_LANGUAGE" VARCHAR2(30 BYTE), 
	"PLAY_NOTE" VARCHAR2(1000 BYTE), 
	"PLAY_FOOD" VARCHAR2(200 BYTE), 
	"PLAY_EQUIPMENT" VARCHAR2(200 BYTE), 
	"PLAY_TRANSPORT" VARCHAR2(200 BYTE), 
	"PLAY_DEL_FLAG" CHAR(1 BYTE) DEFAULT 'N'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REGISTRATION
--------------------------------------------------------

  CREATE TABLE "FSS1234"."REGISTRATION" 
   (	"REG_ID" VARCHAR2(20 BYTE), 
	"GUEST_COUNT" NUMBER, 
	"REG_DATE" DATE DEFAULT sysdate, 
	"REG_CHKIN_DATE" DATE, 
	"REG_CHKOUT_DATE" DATE, 
	"REG_PAY_YN" CHAR(1 BYTE) DEFAULT 'N', 
	"REG_DEL_FLAG" CHAR(1 BYTE) DEFAULT 'C', 
	"REG_MEMBER_ID" VARCHAR2(20 BYTE), 
	"PLAY_ID" VARCHAR2(20 BYTE), 
	"PLACE_ID" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into FSS1234.BOARD
SET DEFINE OFF;
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (3,'코스테이 예약 및 결제 안내','admin','코스테이는 예약하는 모든 게스트에게 몇 가지 정보를 요청하고 있으며, 게스트는 예약 요청을 보내기 전에 이를 모두 제공해야 합니다. 이 정보를 통해 호스트는 숙소에 묵을 게스트의 신원과 연락처를 확인할 수 있습니다.

코스테이가 게스트에게 요구하는 정보는 다음과 같습니다.

성명
이메일 주소
인증된 전화번호
자기소개 메시지
숙소 이용규칙 동의
결제 정보

프로필 사진은 권장 사항이지만 필수는 아닙니다. 게스트가 예약한 후에도 게스트 이메일 주소는 호스트에게 공개되지 않습니다. 대신 에어비앤비를 통해 전송된 메시지가 게스트에게 이메일로 자동 전송됩니다.

일부 호스트는 숙소를 예약하기 전에 코스테이에 신분증을 제출하도록 게스트에게 요구할 수 있습니다.

코스테이를 통해 모든 결제와 커뮤니케이션을 진행해야만 코스테이 이용 약관, 결제 서비스 약관, 취소 및 환불 정책, 호스트 보호 프로그램, 호스트 보호 보험 프로그램 및 기타 안전장치의 보호를 받을 수 있습니다. 또한, 코스테이플랫폼에서 예약하면 숙소 주소, 여행 일정표, 체크인 세부정보 및 기타 중요한 예약 정보를 쉽게 찾거나 확인할 수 있습니다. 코스테이를 통해 진행하지 않은 예약 및 결제에는 이러한 혜택이 제공되지 않습니다.

에어비앤비 사이트 외부에서 결제가 이루어지면 에어비앤비가 사용자 정보를 보호하기 어렵고, 사용자는 사기나 피싱과 같은 보안 위험에 노출될 수 있습니다.

에어비앤비에서는 개인정보 처리방침에 명시된 바와 같이 사용자가 에어비앤비 플랫폼에서 주고받은 메시지를 검토, 스캔 또는 분석할 수 있습니다. 또한 외부 링크를 포함하여 다른 사이트로 연결되는 참조나 연락처 정보를 포함할 수 있는 단어나 번호가 감지되었을 때 메시지가 전송되지 않도록 차단하거나 메시지에서 해당 텍스트를 삭제할 것을 요구할 수 있습니다.',to_date('21/03/11','RR/MM/DD'),1,null,null,'N','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (7,'코스테이  이용 방법 FAQ','admin','공유를 바탕으로 한 커뮤니티
코스테이는 2008년에 두 명의 디자이너가 숙소를 찾고 있던 세 명의 여행자에게 남는 공간을 빌려주면서 시작되었습니다. 
이제는 전 세계 수백만 명의 호스트와 게스트가 코스테이에 무료로 가입하여 자신의 공간을 임대하거나 독특한 숙소를 예약하고 있습니다. 또한, 코스테이체험 호스트는 자신의 취미나 전문지식을 현지인과 여행자와 공유합니다.

신뢰할 수 있는 서비스
코스테이는 쉽고 즐겁고 안전한 공유를 위해 최선을 다하고 있습니다. 코스테이는 개인 프로필과 숙소를 인증하고, 신뢰할 수 있는 플랫폼을 기반으로 안전한 전자거래 서비스를 제공하며, 스마트 메시지 시스템을 통해 호스트와 게스트가 안심하고 소통할 수 있도록 노력하고 있습니다.

여러분의 안전이 최우선입니다. 신뢰 및 안전 센터에서 자세한 내용을 확인하세요.

연중무휴 고객 지원
코스테이에 대한 자주 묻는 질문과 그에 대한 답변은  고객센터에서 찾아보실 수 있습니다. 숙소 검색, 예약 결제, 숙소 호스팅 또는체험 호스팅에 대해 자세히 알아보세요.

코스테이의 커뮤니티 지원 팀은 숙소와 체험에 대한 재예약 지원, 환불, 환급, $1,000,000 호스트 보호 프로그램, 호스트 보호 보험 등 연중무휴 고객 지원 서비스를 총 11개 언어로 제공하고 있습니다. 궁금하신 점이 있으면 코스테이에 문의해주세요.


',to_date('21/03/11','RR/MM/DD'),3,'코스테이 공지사항.png','20210311_014808725_604.png','F','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (13,'이야아아아 드디어!!!새로 오픈한 제주 감귤나무스테이 다녀왔습니다!','dsds','이번에 제가 사는 동네랑 가까운곳에  새로 오픈한곳 있다고 해서 달려가봤습니다. 이름이 말하듯 마당에 감귤나무가 주렁주렁 열려있고, 테라스에 앉아 바라보는 제주 바다의 경치가 사뭇 다르게 멋있더라구요ㅠㅠㅠ 오랜만에 콧바람쐬고 기분전환하고 왔습니다! 바베큐시설도 잘 되어있으니 근교로 나가실 분들에게 추천합니다!',to_date('21/03/11','RR/MM/DD'),15,'jeju2.png','20210311_023437492_995.png','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (9,'신나는 독도 체험!!!!','alal','가족하고 독도에 다녀왔어요! 살면서 독도에 가볼 일이 얼마나 되겠어요. 갈 수 있을 때 가야죠!! 조금 비싼 감이 없지 않아 있지만, 아이들한테도 정말 좋은 추억을 남겨줄 수 있어서 좋았던 것 같아요! ',to_date('21/03/11','RR/MM/DD'),15,'독도1.png','20210311_021120047_193.png','R','Y');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (22,'안녕하세요 신규가입 인사드립니다 :)','ghktk','반갑습니다~ 자주 소통하고 정보 나눠요^^
Hi my name is hwasa.
Hope to get a chance to meet you and I will be a great host. 
Thank you always. Life is good and we love life.',to_date('21/03/11','RR/MM/DD'),5,'hwasa.png','20210311_203635480_604.png','H','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (21,'Authentic oldschool place!','eddy','I literally need to get some rest and it was the perfect place for me to relax!
I did not do anything! Just get Rest and enjoy the sun and feel the authentic mood. Thank you for letting me stay here and probably will back here as sooner as possible!!!!!',to_date('21/03/11','RR/MM/DD'),27,'후기후기.png','20210311_202551756_004.png','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (23,'반가워요 준이라고 해요^_^','choijun','저는  서울에서 작은 카페도 하고 있어요옹^^
편하게 들러주셔도 좋아요옹ㅎㅎ
저희 숙소도 많이 사랑해주세요~
다들..귀여워..( ͡o ͜ʖ ͡o)',to_date('21/03/11','RR/MM/DD'),12,'choijun.jpg','20210311_204431664_097.jpg','H','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (26,'안녕하세요!!신규 호스트 새로 인사드립니돠아!!','dudfl','host는 처음이어서 익숙하지 않은게 많네요^^
그래도 숙소를 매일 가꾸고 청결하게 유지하려고 노력하고 있습니다~><
다들 믿고 이용해주세요ㅎㅎ',to_date('21/03/11','RR/MM/DD'),0,'myTwo.jpg','20210311_210752523_610.jpg','H','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (28,'출장 겸 다녀왔네요 매우 추천.','tupac','피곤해서 편히 쉬고싶은 곳을 찾다가 갔는데 포근한 분위기에 
피로가 싹 풀리더라고요.
좋았습니다. 언제든 갈 의향 100%
주변에 귀여운 고양이들도 있다네요. 구경가보시길..',to_date('21/03/11','RR/MM/DD'),3,'gyeongsang4-3.jpg','20210311_214351313_474.jpg','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (5,'코로나 19 대응 관련 자주 묻는 질문','admin','코로나19 사태와 관련해 게스트를 지원하기 위한 코스테이의 환불 정책과 새로운 프로그램에 대해 알아보세요.

여행을 취소해야 합니다. 어떤 취소 옵션이 있나요?
2021년 3월 12일 혹은 그 이전에 예약이 확정된 게스트 중에서 코로나19로 인해 여행을 할 수 없는 분들은 정상참작이 가능한 상황 정책에 따라 위약금 없이 예약을 취소할 수 있습니다. 

최근 코스테이에서 여행을 예약했는데 코로나19 확산 사태로 인해 계획에 차질이 생기고 있습니다. 예약을 취소할 수 있나요?
2020년 3월 15일 혹은 그 이후에 예약이 확정된 게스트의 경우, 코로나19에 감염된 것이 아니라면 코로나19 관련 정상참작이 가능한 상황 정책이 적용되지 않습니다. 따라서 숙소의 환불 조건을 꼼꼼히 확인하고, 신규 예약 시에는 환불 정책이 유연한 숙소를 선택하시는 것이 좋습니다. 예약 취소 시 선택할 수 있는 옵션은 코스테이  웹사이트나 앱의 여행 섹션에서 확인하실 수 있습니다.

여행을 예약하고 싶지만 코로나19 확산 사태가 어떻게 전개될지 예측하기 어렵습니다. 어떻게 해야 하나요?
현재로서는 향후 여행을 자신 있게 예약하기가 어려우실 것입니다. 코스테이는 모든 게스트에게 예약에 앞서 환불 정책을 꼼꼼하게 확인할 것을 적극적으로 권하고 있습니다. 3월 15일 또는 그 이후 새롭게 예약을 확정하는 게스트는 코로나19 확진 판정을 받은 경우를 제외하고는 어떠한 경우에도 코로나19를 이유로 정상참작이 가능한 상황 정책에 따른 환불을 받을 수 없습니다.

최근 코스테이 숙소를 예약했는데, 이런 상황에서 여행을 가야 할지 결정하지 못하겠어요.
현재 여러 지역에 여행 경보 또는 임시 숙박 제한(단기 임대 포함)이 발효된 상태입니다. 코스테이 도움말 센터의 여행 제한 및 경보 섹션에서 여행에 적용되는 제한사항이 있는지 확인하시기 바랍니다. 코로나19 사태에 대응한 코스테이의 커뮤니티 지원 방안은 자료 센터의 코로나19 관련 업데이트에서 자세히 확인하실 수 있습니다.',to_date('21/03/11','RR/MM/DD'),3,'코로나.png','20210311_014028105_482.png','F','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (10,'코스테이 컨텐츠 관련 FAQ','admin','코스테이 콘텐츠 정책
코스테이에 콘텐츠를 게시하면 콘텐츠 정책 준수에 동의하시는 것입니다. 코스테이는 본 정책,  이용 약관,  커뮤니티 기준, 후기 정책에 위배되는 경우 또는 기타 이유로 콘텐츠의 일부 또는 전부를 삭제할 수 있습니다.

규정을 반복적으로 또는 중대하게 위반한 사용자의 계정은 일시 정지 또는 영구적으로 비활성화될 수 있습니다.
또한, 이 정책에 위배되는 것으로 의심되는 콘텐츠를 발견하면 코스테이로 신고하실 수 있습니다.
코스테이에서 다음과 같은 콘텐츠는 어떤 경우에도 허용되지 않습니다.
광고만을 목적으로 작성된 콘텐츠나 회사 로고, 링크, 회사명 등의 상업적 콘텐츠
스팸, 원치 않는 연락, 방해될 정도로 반복적으로 공유되는 콘텐츠
불법적이거나 위해한 행동을 지지 또는 조장하는 콘텐츠 또는 외설적, 폭력적, 원색적인 내용, 협박 또는 위협을 담은 콘텐츠
차별적인 내용을 담은 콘텐츠(자세한 내용은 코스테이 차별 금지 정책 참고)
타인, 다른 계정 또는 단체를 사칭하는 내용
불법적인 콘텐츠 또는 타인이나 다른 단체의 권리(지식재산권 및 개인정보 보호권 포함)를 침해하는 콘텐츠
숙소의 위치를 유추할 수 있는 콘텐츠를 포함해, 타인의 개인정보나 기밀 정보가 포함된 콘텐츠
다음은 특정 유형의 콘텐츠에 적용되는 위반 사항입니다.

숙소/체험 제목
숙소 종류, 스타일 또는 숙박 경험과 관련성 없는 정보를 담은 숙소 제목
기호나 이모티콘이 포함된 숙소 제목
숙소/체험 페이지 또는 프로필 페이지
사기, 허위, 오해의 소지가 있거나 거짓된 정보를 담은 숙소/체험 페이지와 프로필

커뮤니티 센터
주제와 상관없거나, 질문이 아니거나, 전체 토론에서 질문에 대한 답변으로 지식을 제공하는 것이 아닌 콘텐츠
악플 또는 커뮤니티 회원을 반복적으로 공격하는 콘텐츠
',to_date('21/03/11','RR/MM/DD'),2,'코스테이 공지사항.png','20210311_021432978_327.png','F','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (12,'코스테이 코로나19 상황 관련 정책','admin','정상참작이 가능한 상황 정책 및 코로나바이러스감염증-19(코로나19)

2020년 3월 11일, 세계보건기구(WHO)는 코로나바이러스감염증-19(코로나19)의 확산을 세계적 대유행(팬데믹)으로 선포했습니다. WHO 발표 이후 각국 정부가 코로나19 확산을 늦추기 위해 신속한 대응 정책을 펼치고 있음에도 불구하고 감염자 수는 빠르게 늘고 있습니다.

코스테이는 커뮤니티의 안전을 보호하고 조금이나마 불안감을 덜어드릴 수 있도록 코로나19로 인한 정상참작이 가능한 상황 정책의 적용 범위를 다음과 같이 제시하고 있습니다. 정책 보장 범위에 대한 업데이트 사항을 이 페이지에서 확인해주세요.

2020년 3월 14일 혹은 그 이전에 확정되었으며 체크인 날짜가 오늘부터 45일 이내인 코스테이 숙소 및 체험 예약은 본 정책의 적용 대상으로 체크인 전 취소가 가능합니다. 게스트는 예약 취소 시 다양한 취소 및 환불 옵션을 선택할 수 있습니다. 호스트는 취소 수수료 없이 예약 취소가 가능하며 슈퍼호스트 지위에도 아무런 영향이 없습니다. 취소된 예약에 포함되었던 모든 서비스 수수료는 환불되거나 여행 크레딧으로 제공됩니다. 본 정책에 따라 취소하려면 예약이 정상참작이 가능한 상황에 부합한다는 사실을 증명하거나 이를 입증할 증빙 서류를 제출하셔야 합니다.

2020년 3월 15일 이후 확정된 예약에는 평소와 동일하게 호스트 환불 정책이 적용됩니다.

환불 정책은 취소 요청이 제출된 시점의 정상참작이 가능한 상황 정책에 따라 처리되며, 이미 취소된 예약은 재검토 대상이 아닙니다.

예약이 이미 시작된 경우(체크인 시간이 지난 경우), 정상참작이 가능한 상황 정책이 적용되지 않습니다.

최종 수정일: 2021년 3월 1일',to_date('21/03/11','RR/MM/DD'),2,'코로나대응.png','20210311_022519451_642.png','N','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (11,'코스테이 호스트 관련 보험','admin','코스테이는 안전하고 신뢰할 수 있는 글로벌 커뮤니티를 만드는 데 최선을 다하고 있습니다.

만에 하나라도 숙박 중 숙소에서 신체 상해나 재산 피해가 발생하는 경우, 책임 배상에 대해 최대 미화 1백만 달러까지 호스트를 보호해주는 주 보험입니다.

호스트 보호 보험의 보장 가능 대상

게스트 또는 타인에게 가해진 신체 상해에 대한 법적 책임
게스트 또는 타인이 소유한 재산에 끼친 피해에 대한 법적 책임
건물 로비 및 이웃의 건물 등 공용 공간에 게스트 또는 타인이 가한 피해에 대한 법적 책임',to_date('21/03/11','RR/MM/DD'),0,null,null,'N','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (14,'전남 담양에 다녀왔습니다!','jds9501','한옥구옥에서의 하루는 정말 너무너무 좋았습니다ㅠㅠㅠㅠ 기분 좋은 새소리와 맑은 공기, 거기다 아늑한 숙소까지ㅠㅠㅠ 삼박자가 고루 맞아 더할나위 없는 휴가를 보내고 왔어요! 하루 이틀정도 짧게 나마 리프레쉬하며 스트레스 날리고 싶으신 분들에게 추천합니다ㅠㅠㅠ',to_date('21/03/11','RR/MM/DD'),2,'templestay.png','20210311_023756738_193.png','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (16,'It was best experience i''ve never had!','rachel','I  have been to Gangwondo so many times which is one of my fave cities in Korea but this time was absolutely the best time I''ve ever had! The ocean view was awesome and the room was amazing!  Thank you for letting me stay here and will give you 5 stars! Obiousely!',to_date('21/03/11','RR/MM/DD'),8,'숙소.jpg','20210311_024454289_404.jpg','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (17,'Best authentic place','Thor','I went to Jeju with my girlfriend and we just wanted to stay somewhere authentic place and I found the best place in Costay. anyway, it was Literally perfect to stay! It was calm and peaceful and enough to feel an authentic Korean vibe! ',to_date('21/03/11','RR/MM/DD'),7,'authentic.jpg','20210311_025057708_276.jpg','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (18,'여자친구랑 다녀온 풀빌라!','suunho','3주년 기념일을 맞이해 다녀온 풀빌라! 
',to_date('21/03/11','RR/MM/DD'),10,'숙소ㅇㅇ.jpg','20210311_025428768_082.jpg','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (19,'stayed 2 nights here and definitely  will recoomand you!','eddy','Stayed here for 2 nights and it was a pretty good place when you need any place to stay in Seoul! The price was quite cheap but the service and room were much better than I expected! ',to_date('21/03/11','RR/MM/DD'),13,null,null,'R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (24,'여기가 신규 인사하는 곳 맞나요?반갑습니다.','alal','다들 반가워요 저는 황미미라고 합니다.
처음 글을 쓰는데 어색하네요.
제 숙소도 구경해 주시면 감사하겠습니다^^
It’s nice to all of you. My name is Mimi Hwang. It’s awkward to write for the first time.
I would appreciate it if you could visit my accommodation as well^^',to_date('21/03/11','RR/MM/DD'),0,'myOne.jpg','20210311_205807664_825.jpg','H','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (25,'Amazing Scienary and beautiful place','bill','When you just wake up, you can enjoy the unforgettable ocean view and
 I bet no one can''t explain this feeling. 
Drink Coffee and get some relaxation in this perfect place. 
It will let you feel awesome moments. It seems a kind of present for me.
If you need to relax and take some time for yourself, then I will definitely recommend this place! 
',to_date('21/03/11','RR/MM/DD'),8,'place.jpg','20210311_210206408_383.jpg','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (29,'여행 및 COVID-19에 대해 알아야 할 사항','Jamie','전 세계에서 코로나19 전염병이 계속되고 있는 이 어려운 시기에 코스테이는 여행자를 도울 준비가 되어 있습니다. 전 세계 여행지에 대한 최신 여행 정보와 코로나19 확산을 막을 수 있는 방법, 그리고 하루가 다르게 변하는 상황에 대한 최신 정보를 파악할 수 있는 자료와 세부내용을 확인해보세요.

글로벌 코로나19 대한 정보
거주 국가와 여행지에 적용되는 여행 제한 사항과 가이드라인을 확인하고, 모든 출처에 표기된 날짜에 주의를 기울여 최신 정보를 검토하고 있는지 확인하시기 바랍니다.',to_date('21/03/12','RR/MM/DD'),1,'caption.jpg','20210312_045553087_467.jpg','N','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (15,'전남 담양에 다녀왔습니다!','jds9501','한옥구옥에서의 하루는 정말 너무너무 좋았습니다ㅠㅠㅠㅠ 기분 좋은 새소리와 맑은 공기, 거기다 아늑한 숙소까지ㅠㅠㅠ 삼박자가 고루 맞아 더할나위 없는 휴가를 보내고 왔어요! 하루 이틀정도 짧게 나마 리프레쉬하며 스트레스 날리고 싶으신 분들에게 추천합니다ㅠㅠㅠ',to_date('21/03/11','RR/MM/DD'),3,'templestay.png','20210311_023754172_969.png','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (27,'덕분에 편하게 잘 쉬다가 갑니다~^^','bewhy','교통도 잘 되어있어서 다니기 편했고, 방이 춥거나 하지 않아서 좋았어요^^
오소록에서  지내보니 제주도에 애정이 더 생기게 되는거같아요
혼자 떠나고 싶으실때 오시면 편히 쉬실 수 있을거같네요~',to_date('21/03/11','RR/MM/DD'),0,'jeju5-2.jpg','20210311_213620063_084.jpg','R','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (1,'코스테이 코로나19 관련 방역 수칙','admin','코스테이는 커뮤니티의 안전을 무엇보다 중시합니다. 코로나19 확산 사태가 지속되는 가운데 게스트가 안심하고 머물 수 있도록 전 세계 에어비앤비 호스트가 업데이트된 안전 및 청소 절차를 실천하고 있습니다. 코스테이의 안전 기준이 새롭게 변경되었으며, 2021년 3월 20일까지 모든 호스트는 이러한 새로운 수칙을 준수하는 데 동의해야 합니다.
자세한 안내사항은 아래의 링크를 참조 부탁드립니다',to_date('21/03/11','RR/MM/DD'),2,'코로나.png','20210311_012935166_921.png','N','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (2,'코스테이 이용방법','admin','1. 검색 필터를 적용하여 원하는 결과 찾기
원하는 조건에 맞는 결과를 찾을 수 있도록 가격대나 수영장 같은 필터를 적용하여 검색을 맞춤설정하세요.

2.사진을 확인해보세요. 그런 다음 이전 게스트의 후기를 통해 예약이 어떠할지 가늠해보세요.

3.안전한 결제 처리를 위해 코스테이는 개인정보를 철저히 보호하고 글로벌 보안 기준을 준수합니다.

4.궁금한 사항이 있는 경우 호스트에게 메시지를 보내 물어보세요. 유용한 현지 팁과 조언을 얻으실 수 있습니다.',to_date('21/03/11','RR/MM/DD'),5,'코스테이 공지사항.png','20210311_013157461_243.png','N','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (4,'코스테이 이용시 주의사항','admin','의심스러운 메시지

절대  코스테이 사이트 외부에서 결제하지 마세요. 누군가가 사이트 밖에서 예약금을 결제하라고 요청할 경우 또는 누군가가 가짜 코스테이 웹사이트로 의심되는 링크를 보내는 경우, 이 양식을 작성하고 메시지를 신고해서 코스테이로 알려주세요.

온라인 또는 은행 송금 등 코스테이를 통하지 않고 호스트에게 결제한 경우, 사기를 당하셨을 수 있습니다. 
코스테이로 즉시 신고하여 도움을 받으세요.

사기인지 확실하지 않은 경우 코스테이를 통해 예약이 진행되었는지 확인해 보시기 바랍니다.

의심스러운 메시지 신고 방법:
메시지로 이동한 후, 수상한 메시지가 포함된 대화를 누르세요.
메시지에 표시되는 깃발 아이콘()을 누르세요.
이 사람을 신고하는 이유를 선택하고 이어지는 안내에 따르세요.',to_date('21/03/11','RR/MM/DD'),5,null,null,'N','N');
Insert into FSS1234.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ENROLL_DATE,BOARD_READ_COUNT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_CATEGORY,BOARD_DEL_FLAG) values (6,'환불 정책에 대한 FAQ','admin','코스테이에서 예약 취소가 허용되는 경우, 본 정책이 해당 예약의 환불 정책을 통제하며 이보다 우선 적용됩니다. 본 정책의 적용 대상이 되는 사건에 영향을 받은 게스트는 예약을 취소하고 상황에 따라 현금 환불, 여행 크레딧 및 기타 보상을 받을 수 있습니다. 본 정책의 적용 대상이 되는 사건의 영향을 받은 호스트는 불이익을 받지 않고 예약을 취소할 수 있지만, 경우에 따라서는 취소된 예약 일자의 예약이 차단될 수 있습니다.

적용 대상
본 정책에서는 예약 시점 당시에는 예상할 수 없었으나 예약 후 발생하여 예약 이행을 불가능하게 하거나 이행이 법적으로 금지되는 다음 상황을 ''사건''이라고 지칭합니다.

정부의 여행 제한 조치 변경. 정부 기관이 비자나 여권 발행 요건을 예기치 않게 변경하여 목적지로의 여행이 불가능한 경우. 여권의 분실이나 만료, 그 밖에 게스트의 개인적 사정으로 여행 허가 관련 문제가 발생한 경우는 해당하지 않습니다.

긴급 상황 및 전염병 유행 선포. 정부가 선포한 지역/국가 차원의 긴급 상황, 전염병의 지역/전 세계 유행, 공중보건 긴급 상황. 태국의 말라리아나 하와이의 뎅기열과 같이 특정 지역과 일반적으로 연관된 풍토병은 해당되지 않습니다.

정부의 여행 제한 조치. 숙소/체험 지역을 오가거나 해당 지역에서 체류하는 것을 금지하는 정부 기관의 여행 제한 조치. 구속력이 없는 여행 경보나 이와 유사한 정부 지침은 해당하지 않습니다.

군사 행동 및 기타 적대 행위. 전쟁, 적대 행위, 침략, 내전, 테러, 폭발, 폭격, 반란, 폭동, 봉기, 시민 소요 및 무질서 등.

자연재해. 자연재해, 천재지변, 필수 공공기반 서비스(수도, 전기 등)의 대규모 공급 중단, 화산 폭발, 쓰나미, 기타 심각하고 비정상적인 기상 여건. 해당 지역에서 흔히 발생하여 예상 가능한 기상 또는 자연 여건(예: 플로리다의 허리케인철에 발생하는 허리케인)은 여기에 해당하지 않습니다.

적용 대상이 아닌 경우
상기 명시된 상황이 아닌 기타 모든 경우. 상기 명시된 사건에 해당하는 경우에만 본 정책에 따라 예약을 취소하실 수 있습니다. 기타 모든 경우는 제외됩니다. 본 정책의 적용 대상에 해당하지 않는 예약 취소 사유의 예시: 예기치 못한 질병, 건강 악화 또는 부상, 배심원 의무, 법원 출두, 군 복무 등 정부 명령에 따른 의무, (여행 금지나 입국 금지 조치보다 낮은 단계의) 여행 경보나 기타 정부 지침, 예약 목적이었던 행사나 이벤트의 취소나 일정 변경, 정책 적용 대상에 해당하는 사건(도로 폐쇄, 항공편·기차·버스·페리 운행 취소 등)과 관련이 없는 교통편 운행 차질. 이러한 사유로 예약을 취소하는 경우, 환불 금액은 해당 예약에 적용되는 환불 정책에 따라 결정됩니다.',to_date('21/03/11','RR/MM/DD'),1,'코스테이 공지사항.png','20210311_014521775_402.png','F','N');
REM INSERTING into FSS1234.BOARD_COMMENT
SET DEFINE OFF;
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (5,1,'OMG! The scenery is amazzzzzzing!!!!',16,null,to_date('21/03/11','RR/MM/DD'),'R','N','eddy');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (8,1,'Why do you keep asking me to write',21,null,to_date('21/03/11','RR/MM/DD'),'R','N','jinha');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (9,1,'why?',21,null,to_date('21/03/11','RR/MM/DD'),'R','N','bewhy');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (12,1,'싫습니다.',22,null,to_date('21/03/11','RR/MM/DD'),'H','N','tupac');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (13,1,'사 랑 해 요 최 준 !',23,null,to_date('21/03/11','RR/MM/DD'),'H','N','jinha');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (14,1,'철이 없었죠....',23,null,to_date('21/03/11','RR/MM/DD'),'H','N','jinha');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (15,1,'이미 준며들었어요....',23,null,to_date('21/03/11','RR/MM/DD'),'H','N','jinha');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (3,1,'오.... 독도 비싼가요...? 얼마에 가셨나요..?',9,null,to_date('21/03/11','RR/MM/DD'),'R','N','bewhy');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (4,2,'10만원에 갔습니다!!',9,3,to_date('21/03/11','RR/MM/DD'),'R','N','alal');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (7,1,'I don''t think so',19,null,to_date('21/03/11','RR/MM/DD'),'R','N','bill');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (11,1,'나만없누',18,null,to_date('21/03/11','RR/MM/DD'),'R','N','tupac');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (6,1,'Why is it written in Korean in the attached file?',21,null,to_date('21/03/11','RR/MM/DD'),'R','N','bill');
Insert into FSS1234.BOARD_COMMENT (BOARD_COMMENT_NO,BOARD_COMMENT_LEVEL,BOARD_COMMENT_CONTENT,BOARD_REF,BOARD_COMMENT_REF,BOARD_COMMENT_ENROLL_DATE,BOARD_COMMENT_CATEGORY,BOARD_COMMENT_DEL_FLAG,BOARD_COMMENT_WRITER) values (10,2,'lollll',21,8,to_date('21/03/11','RR/MM/DD'),'R','N','bewhy');
REM INSERTING into FSS1234.COMMENT_TABLE
SET DEFINE OFF;
REM INSERTING into FSS1234.IMAGESTORE
SET DEFINE OFF;
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (365,'templestay.png','20210311_112710702_772.png','play_190',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (366,'temple.png','20210311_112710698_965.png','play_190',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (364,'temple2.png','20210311_112710709_908.png','play_190',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (370,'surfing.png','20210311_113221817_466.png','play_192',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (371,'surfing2.png','20210311_113221813_970.png','play_192',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (372,'surfing3.png','20210311_113221808_009.png','play_192',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (373,'5-3.jpg','20210311_113403834_663.jpg','play_193',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (374,'5-2.jpg','20210311_113403831_519.jpg','play_193',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (375,'5-1.jpg','20210311_113403829_869.jpg','play_193',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (376,'gamja2.png','20210311_113447183_446.png','play_194',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (377,'gamja.png','20210311_113447179_844.png','play_194',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (378,'gamja3.png','20210311_113447176_157.png','play_194',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (379,'6-3.jpg','20210311_113505475_327.jpg','play_195',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (380,'6-2.jpg','20210311_113505473_555.jpg','play_195',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (381,'6-1.jpg','20210311_113505471_824.jpg','play_195',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (382,'7-3.jpg','20210311_113723156_933.jpg','play_196',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (383,'7-2.jpg','20210311_113723153_231.jpg','play_196',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (384,'7-1.jpg','20210311_113723132_827.jpg','play_196',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (385,'8-3.jpg','20210311_113828458_027.jpg','play_197',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (386,'8-2.jpg','20210311_113828454_247.jpg','play_197',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (387,'8-1.jpg','20210311_113828451_430.jpg','play_197',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (388,'goindol.png','20210311_114504072_742.png','play_198',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (389,'goindol2.png','20210311_114504069_993.png','play_198',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (390,'goindol3.png','20210311_114504066_943.png','play_198',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (391,'9-3.jpg','20210311_114638380_377.jpg','play_199',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (392,'9-2.jpg','20210311_114638378_718.jpg','play_199',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (393,'9-1.jpg','20210311_114638374_408.jpg','play_199',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (406,'12-3.jpg','20210311_115843775_198.jpg','play_204',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (409,'farm33.png','20210311_120639270_974.png','play_205',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (410,'farm22.png','20210311_120639265_339.png','play_205',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (411,'farm.png','20210311_120639259_246.png','play_205',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (412,'13-3.png','20210311_120721457_216.png','play_206',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (414,'13-1.png','20210311_120721437_606.png','play_206',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (415,'mosi3.png','20210311_120933250_183.png','play_207',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (416,'mosi.png','20210311_120933245_685.png','play_207',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (417,'mosi2.png','20210311_120933238_213.png','play_207',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (418,'14-3.jpg','20210311_120954685_702.jpg','play_208',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (419,'14-2.jpg','20210311_120954683_391.jpg','play_208',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (420,'14-1.jpg','20210311_120954681_121.jpg','play_208',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (423,'15-1.jpg','20210311_121055888_987.jpg','play_209',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (430,'place_01_03.jpg','20210311_121205302_801.jpg',null,'place_235');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (431,'place_01_02.jpg','20210311_121205297_895.jpg',null,'place_235');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (442,'18-3.jpg','20210311_121922618_659.jpg','play_214',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (443,'18-2.jpg','20210311_121922614_607.jpg','play_214',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (444,'18-1.jpg','20210311_121922612_221.jpg','play_214',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (448,'cheese3.png','20210311_122229852_761.png','play_217',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (449,'cheese2.png','20210311_122229849_470.png','play_217',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (463,'tea3.png','20210311_123358575_176.png','play_221',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (464,'tes2.png','20210311_123358571_936.png','play_221',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (465,'tea.png','20210311_123358566_548.png','play_221',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (490,'chungcheong1-3.png','20210311_162246188_372.png',null,'place_244');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (491,'chungcheong1-2.png','20210311_162246186_790.png',null,'place_244');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (492,'chungcheong1-1.png','20210311_162246184_128.png',null,'place_244');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (13,'gangwon1-2.jpg','20210311_000259067_866.jpg',null,'place_102');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (14,'gangwon1-2.jpg','20210311_000259067_866.jpg',null,'place_102');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (15,'gangwon1-2.jpg','20210311_000259067_866.jpg',null,'place_102');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (342,'hanlabong.png','20210311_102201053_056.png','play_183',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (413,'13-2.png','20210311_120721445_530.png','play_206',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (437,'korea2.png','20210311_121409180_621.png','play_212',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (496,'history3.png','20210311_165054554_247.png','play_233',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (497,'history2.png','20210311_165054543_048.png','play_233',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (498,'history.png','20210311_165054530_842.png','play_233',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (128,'place_09_02.jpg','20210310_230617342_648.jpg',null,'place_118');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (129,'place_09_01.jpg','20210310_230617339_547.jpg',null,'place_118');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (55,'place_01_03.jpg','20210310_224329619_613.jpg',null,'place_107');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (57,'place_01_01.jpg','20210310_224329610_114.jpg',null,'place_107');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (64,'place_02_03.jpg','20210310_224731853_269.jpg',null,'place_109');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (65,'place_02_02.jpg','20210310_224731848_257.jpg',null,'place_109');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (66,'place_02_01.jpg','20210310_224731841_958.jpg',null,'place_109');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (76,'place_03_03.jpg','20210310_225131283_056.jpg',null,'place_111');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (77,'place_03_02.jpg','20210310_225131280_356.jpg',null,'place_111');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (78,'place_03_01.jpg','20210310_225131276_703.jpg',null,'place_111');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (79,'place_04_03.jpg','20210310_225308540_449.jpg',null,'place_112');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (80,'place_04_02.jpg','20210310_225308536_589.jpg',null,'place_112');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (97,'place_05_03.jpg','20210310_225539818_042.jpg',null,'place_114');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (98,'place_05_02.jpg','20210310_225539815_426.jpg',null,'place_114');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (99,'place_05_01.jpg','20210310_225539810_475.jpg',null,'place_114');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (118,'place_08_03.jpg','20210310_230349366_406.jpg',null,'place_117');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (119,'place_08_02.jpg','20210310_230349363_080.jpg',null,'place_117');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (120,'place_08_01.jpg','20210310_230349356_760.jpg',null,'place_117');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (127,'place_09_03.jpg','20210310_230617344_783.jpg',null,'place_118');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (133,'place_10_03.jpg','20210310_230823589_578.jpg',null,'place_119');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (134,'place_10_02.jpg','20210310_230823586_924.jpg',null,'place_119');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (135,'place_10_01.jpg','20210310_230823583_610.jpg',null,'place_119');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (160,'place_11_03.jpg','20210310_231556675_165.jpg',null,'place_123');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (161,'place_11_02.jpg','20210310_231556673_576.jpg',null,'place_123');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (162,'place_11_01.jpg','20210310_231556670_582.jpg',null,'place_123');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (169,'jeju3-3.jpg','20210310_231734017_246.jpg',null,'place_124');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (170,'jeju3-2.jpg','20210310_231734015_555.jpg',null,'place_124');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (171,'jeju3-1.jpg','20210310_231734013_163.jpg',null,'place_124');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (173,'place_12_02.jpg','20210310_231855213_143.jpg',null,'place_125');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (174,'place_12_01.jpg','20210310_231855211_969.jpg',null,'place_125');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (214,'place_14_03.jpg','20210310_233048046_577.jpg',null,'place_130');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (215,'place_14_02.jpg','20210310_233048043_458.jpg',null,'place_130');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (216,'place_14_01.jpg','20210310_233048039_025.jpg',null,'place_130');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (217,'place_15_03.jpg','20210310_234045050_848.jpg',null,'place_131');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (218,'place_15_02.jpg','20210310_234045046_564.jpg',null,'place_131');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (219,'place_15_01.jpg','20210310_234045043_757.jpg',null,'place_131');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (233,'place_16_02.jpg','20210310_234558503_940.jpg',null,'place_135');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (259,'place_20_03.jpg','20210311_000320671_435.jpg',null,'place_139');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (260,'place_20_02.jpg','20210311_000320666_914.jpg',null,'place_139');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (261,'place_20_01.jpg','20210311_000320661_990.jpg',null,'place_139');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (262,'place_21_03.jpg','20210311_000500578_044.jpg',null,'place_140');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (263,'place_21_02.jpg','20210311_000500575_142.jpg',null,'place_140');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (264,'place_21_01.jpg','20210311_000500572_717.jpg',null,'place_140');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (265,'gangwon2-1.jpg','20210311_000543374_878.jpg',null,'place_141');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (266,'gangwon2-3.jpg','20210311_000543373_426.jpg',null,'place_141');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (267,'gangwon2-2.jpg','20210311_000543372_017.jpg',null,'place_141');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (268,'서울22_3.jpg','20210311_000616315_988.jpg',null,'place_142');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (269,'서울22_2.jpg','20210311_000616311_797.jpg',null,'place_142');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (340,'jeju2.png','20210311_102201066_812.png','play_183',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (341,'jeju.png','20210311_102201059_725.png','play_183',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (335,'jeolla3-2.jpg','20210311_025403739_789.jpg',null,'place_189');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (336,'jeolla3-1.jpg','20210311_025403737_811.jpg',null,'place_189');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (344,'1-2.jpg','20210311_105714149_404.jpg','play_184',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (345,'1-1.jpg','20210311_105714145_905.jpg','play_184',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (356,'2-2.jpg','20210311_112405313_847.jpg','play_187',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (357,'2-1.jpg','20210311_112405311_561.jpg','play_187',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (358,'3-3.jpg','20210311_112515201_673.jpg','play_188',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (359,'3-2.jpg','20210311_112515200_887.jpg','play_188',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (360,'3-1.jpg','20210311_112515196_352.jpg','play_188',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (445,'19-3.jpg','20210311_122010464_569.jpg','play_215',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (446,'19-2.png','20210311_122010426_327.png','play_215',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (447,'19-1.jpg','20210311_122010423_984.jpg','play_215',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (244,'place_17_03.jpg','20210310_235026144_317.jpg',null,'place_136');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (245,'place_17_02.jpg','20210310_235026141_234.jpg',null,'place_136');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (253,'place_18_03.jpg','20210311_000011232_225.jpg',null,'place_137');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (254,'place_18_02.jpg','20210311_000011228_020.jpg',null,'place_137');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (255,'place_18_01.jpg','20210311_000011225_891.jpg',null,'place_137');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (270,'서울22_1.jpg','20210311_000616305_770.jpg',null,'place_142');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (271,'gangwon3-3.jpg','20210311_000811744_006.jpg',null,'place_143');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (272,'gangwon3-2.jpg','20210311_000811743_665.jpg',null,'place_143');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (273,'gangwon3-1.jpg','20210311_000811742_363.jpg',null,'place_143');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (295,'jeolla3-2.jpg','20210311_003204792_997.jpg',null,'place_151');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (296,'jeolla3-3.jpg','20210311_003204791_578.jpg',null,'place_151');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (297,'jeolla3-1.jpg','20210311_003204789_493.jpg',null,'place_151');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (307,'gyeongsang4-2.jpg','20210311_004016535_774.jpg',null,'place_157');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (308,'gyeongsang4-3.jpg','20210311_004016535_459.jpg',null,'place_157');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (309,'gyeongsang4-1.jpg','20210311_004016534_895.jpg',null,'place_157');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (315,'chungcheong1-1.jpg','20210311_161159269_001.jpg',null,'place_159');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (319,'chungcheong2-3.jpg','20210311_004542801_374.jpg',null,'place_160');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (320,'chungcheong2-1.jpg','20210311_004542800_142.jpg',null,'place_160');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (321,'chungcheong2-2.jpg','20210311_004542799_216.jpg',null,'place_160');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (334,'jeolla3-3.jpg','20210311_025403741_590.jpg',null,'place_189');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (343,'1-3.jpg','20210311_105714154_904.jpg','play_184',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (349,'bulloon3.png','20210311_111835997_953.png','play_185',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (350,'bulloon2.png','20210311_111835994_979.png','play_185',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (351,'bulloon.png','20210311_111835984_529.png','play_185',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (352,'horse2.png','20210311_112254758_770.png','play_186',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (353,'horse3.png','20210311_112254754_700.png','play_186',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (354,'horse2.png','20210311_112254748_881.png','play_186',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (361,'4-3.jpg','20210311_112615122_124.jpg','play_189',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (362,'4-2.jpg','20210311_112615120_451.jpg','play_189',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (363,'4-1.jpg','20210311_112615098_799.jpg','play_189',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (367,'kanu3.png','20210311_112948264_159.png','play_191',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (368,'kanu2.png','20210311_112948254_118.png','play_191',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (369,'kanu.png','20210311_112948250_324.png','play_191',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (394,'10-3.jpg','20210311_114736702_268.jpg','play_201',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (395,'10-2.jpg','20210311_114736696_385.jpg','play_201',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (396,'10-1.jpg','20210311_114736691_395.jpg','play_201',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (397,'mud3.png','20210311_114740663_853.png','play_200',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (398,'mud2.png','20210311_114740660_618.png','play_200',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (399,'mud.png','20210311_114740655_850.png','play_200',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (400,'11-3.jpg','20210311_114835139_429.jpg','play_202',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (401,'11-2.jpg','20210311_114835135_475.jpg','play_202',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (402,'11-1.jpg','20210311_114835132_297.jpg','play_202',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (403,'science.png','20210311_114915236_213.png','play_203',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (404,'science3.png','20210311_114915232_698.png','play_203',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (405,'science2.png','20210311_114915229_458.png','play_203',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (407,'12-2.jpg','20210311_115843771_393.jpg','play_204',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (408,'12-1.jpg','20210311_115843763_514.jpg','play_204',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (421,'15-3.jpg','20210311_121055898_184.jpg','play_209',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (422,'15-2.jpg','20210311_121055893_940.jpg','play_209',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (424,'16-3.jpg','20210311_121147294_316.jpg','play_211',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (425,'16-2.jpg','20210311_121147292_527.jpg','play_211',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (426,'16-1.jpg','20210311_121147290_049.jpg','play_211',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (432,'place_01_01.jpg','20210311_121205282_594.jpg',null,'place_235');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (433,'place_02_03.jpg','20210311_121357388_685.jpg',null,'place_236');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (434,'place_02_02.jpg','20210311_121357377_951.jpg',null,'place_236');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (435,'place_02_01.jpg','20210311_121357372_638.jpg',null,'place_236');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (436,'korea.png','20210311_121409183_851.png','play_212',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (438,'korea3.png','20210311_121409176_466.png','play_212',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (439,'17-3.jpg','20210311_121827419_355.jpg','play_213',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (440,'17-2.jpg','20210311_121827416_990.jpg','play_213',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (441,'17-1.jpg','20210311_121827413_989.jpg','play_213',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (450,'cheese.png','20210311_122229837_314.png','play_217',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (451,'sky3.png','20210311_122447773_893.png','play_218',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (452,'sky2.png','20210311_122447768_535.png','play_218',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (453,'sky.png','20210311_122447764_485.png','play_218',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (454,'bamboo3.png','20210311_122728789_203.png','play_219',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (455,'bamboo2.png','20210311_122728784_736.png','play_219',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (456,'bamboo.png','20210311_122728779_133.png','play_219',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (457,'gyeongsang1-1.jpg','20210311_122732346_924.jpg',null,'place_237');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (458,'gyeongsang1-2.jpg','20210311_122732345_476.jpg',null,'place_237');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (459,'gyeongsang1-3.jpg','20210311_122732344_432.jpg',null,'place_237');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (460,'culture3.png','20210311_122948506_551.png','play_220',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (461,'culture2.png','20210311_122948503_885.png','play_220',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (462,'culture.png','20210311_122948499_901.png','play_220',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (466,'monorail3.png','20210311_124415964_879.png','play_222',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (467,'monirail2.png','20210311_124415959_139.png','play_222',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (468,'monorail.png','20210311_124415954_959.png','play_222',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (472,'berry3.png','20210311_124634539_787.png','play_223',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (473,'berry2.png','20210311_124634535_809.png','play_223',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (474,'berry.png','20210311_124634530_583.png','play_223',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (475,'jeju4-3.jpg','20210311_124637500_206.jpg',null,'place_239');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (476,'jeju4-1.jpg','20210311_124637490_987.jpg',null,'place_239');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (477,'jeju4-2.jpg','20210311_124637489_419.jpg',null,'place_239');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (481,'fishing3.png','20210311_125059339_037.png','play_225',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (482,'fishing2.png','20210311_125059335_306.png','play_225',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (483,'fishing.png','20210311_125059331_249.png','play_225',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (484,'pink3.png','20210311_125325241_281.png','play_226',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (485,'pink2.png','20210311_125325236_901.png','play_226',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (486,'pink.png','20210311_125325231_638.png','play_226',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (346,'gyeonggi1-1.png','20210311_154437382_969.png',null,'place_224');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (347,'gyeonggi1-1.png','20210311_154437382_969.png',null,'place_224');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (348,'gyeonggi1-1.png','20210311_154437382_969.png',null,'place_224');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (355,'2-3.jpg','20210311_112405315_105.jpg','play_187',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (493,'dokdo3.png','20210311_165006678_013.png','play_232',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (494,'dokdo2.png','20210311_165006673_329.png','play_232',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (495,'dokdo.png','20210311_165006665_954.png','play_232',null);
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (56,'place_01_02.jpg','20210310_224329616_421.jpg',null,'place_107');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (70,'gyeonggi3-1.jpg','20210310_225108495_678.jpg',null,'place_110');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (71,'gyeonggi3-2.jpg','20210310_225108492_935.jpg',null,'place_110');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (72,'gyeonggi3-3.jpg','20210310_225108490_959.jpg',null,'place_110');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (81,'place_04_01.jpg','20210310_225308532_817.jpg',null,'place_112');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (88,'gyeonggi2-3.png','20210310_225450184_568.png',null,'place_113');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (89,'gyeonggi2-1.png','20210310_225450176_437.png',null,'place_113');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (90,'gyeonggi2-2.png','20210310_225450170_539.png',null,'place_113');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (106,'place_06_03.jpg','20210310_225733649_011.jpg',null,'place_115');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (107,'place_06_02.jpg','20210310_225733643_425.jpg',null,'place_115');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (108,'place_06_01.jpg','20210310_225733640_546.jpg',null,'place_115');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (109,'place_07_03.jpg','20210310_225912983_252.jpg',null,'place_116');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (110,'place_07_02.jpg','20210310_225912979_561.jpg',null,'place_116');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (111,'place_07_01.jpg','20210310_225912974_071.jpg',null,'place_116');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (142,'jeju1-2.jpg','20210310_231136164_252.jpg',null,'place_121');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (143,'jeju1-1.jpg','20210310_231136163_942.jpg',null,'place_121');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (144,'jeju1-3.jpg','20210310_231136160_233.jpg',null,'place_121');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (172,'place_12_03.jpg','20210310_231855215_501.jpg',null,'place_125');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (232,'place_16_03.jpg','20210310_234558508_210.jpg',null,'place_135');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (234,'place_16_01.jpg','20210310_234558498_808.jpg',null,'place_135');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (246,'place_17_01.jpg','20210310_235026132_699.jpg',null,'place_136');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (256,'place_19_03.jpg','20210311_000133675_688.jpg',null,'place_138');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (257,'place_19_02.jpg','20210311_000133672_069.jpg',null,'place_138');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (258,'place_19_01.jpg','20210311_000133667_045.jpg',null,'place_138');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (283,'gangwon4-3.jpg','20210311_001655075_313.jpg',null,'place_147');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (284,'gangwon4-2.jpg','20210311_001655073_642.jpg',null,'place_147');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (285,'gangwon4-1.jpg','20210311_001655073_237.jpg',null,'place_147');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (298,'gyeongsang2-3.jpg','20210311_003656729_174.jpg',null,'place_152');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (299,'gyeongsang2-2.jpg','20210311_003656728_893.jpg',null,'place_152');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (300,'gyeongsang2-1.jpg','20210311_003656727_476.jpg',null,'place_152');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (301,'gyeongsang3-3.jpg','20210311_003806250_287.jpg',null,'place_153');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (302,'gyeongsang3-1.jpg','20210311_003806248_014.jpg',null,'place_153');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (303,'gyeongsang3-2.jpg','20210311_003806247_088.jpg',null,'place_153');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (313,'chungcheong1-1.jpg','20210311_161159269_001.jpg',null,'place_159');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (314,'chungcheong1-1.jpg','20210311_161159269_001.jpg',null,'place_159');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (325,'chungcheong3-3.jpg','20210311_004809800_412.jpg',null,'place_162');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (326,'chungcheong3-2.jpg','20210311_004809799_958.jpg',null,'place_162');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (327,'chungcheong3-1.jpg','20210311_004809798_869.jpg',null,'place_162');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (331,'jeju5-3.jpg','20210311_005057272_478.jpg',null,'place_163');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (332,'jeju5-2.jpg','20210311_005057270_775.jpg',null,'place_163');
Insert into FSS1234.IMAGESTORE (IMAGE_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,PLAY_ID,PLACE_ID) values (333,'jeju5-1.jpg','20210311_005057266_244.jpg',null,'place_163');
REM INSERTING into FSS1234.MEMBER
SET DEFINE OFF;
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('alal','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','황미미','myOne.jpg','20210311_184442251_026.jpg','M32919837','01092359191','M',to_date('00/06/13','RR/MM/DD'),'제주시 공항로 2','alal@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('bewhy','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','비아이','비아이.jpg','20210310_213708510_541.jpg','M70689018','01015301035','M',to_date('93/06/23','RR/MM/DD'),'인천광역시 미추홀구','bewhy@naver.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('admin','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유자석','유쟈.png','20210312_044545041_432.png','M71689098','01053010503','M',to_date('78/06/11','RR/MM/DD'),'인천광역시 서구','admin@costay.co.kr',to_date('21/03/10','RR/MM/DD'),'N','A');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('tupac','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','투팍','images.jpg','20210310_213900948_893.jpg','12318594','01059484847','M',to_date('98/06/06','RR/MM/DD'),'New York','tupac@google.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('gonghangdodook','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','공도둑','download.jpg','20210310_214419157_109.jpg','11591981','01012341234','M',to_date('84/07/10','RR/MM/DD'),'Seoul','gong@hang.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('dsds','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정다솜','snap.jpg','20210310_214430365_531.jpg','M59897900','01080729501','F',to_date('93/11/09','RR/MM/DD'),'Seoul','jdsss2634@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('jdsss','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김다솜','sunset.jpg','20210310_214656326_661.jpg','m59890000','01026343722','F',to_date('87/06/23','RR/MM/DD'),'경기도 화성시','dasom@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('bill','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','BillSkarsgard','빌스카스가드.png','20210310_214740959_965.png','P59000001','01077179333','M',to_date('90/08/09','RR/MM/DD'),'Sweden Stockholm','bill@fss.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('jaesuk','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유재석','jjal.jpg','20210310_214802738_428.jpg','m56990123','01099991234','M',to_date('71/07/01','RR/MM/DD'),'제주도 서귀포시','jaesuk@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('jds9501','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정이랑','IMG_20121018_3.png','20210310_214952493_807.png','m71459283','01080910846','F',to_date('90/06/01','RR/MM/DD'),'Seoul','jds9501@naver.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('yoon','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','윤여정','yoon.jpg','20210310_215311704_935.jpg','M15472543','01047811246','F',to_date('47/06/19','RR/MM/DD'),'서울특별시 종로구 평창동','yoon@fss.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('rachel','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','RachelJeong','rchel.png','20210310_215418901_573.png','m78204729','01090749274','F',to_date('73/10/31','RR/MM/DD'),'Canada','rachel@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('Thor','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','Thor','thor.png','20210310_215543249_945.png','s846729473','01038483974','M',to_date('87/04/19','RR/MM/DD'),'Sydney','Thor@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('eddy','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','EddyChoi','choi.jpg','20210310_220616212_302.jpg','ZE000571','01057121010','M',to_date('90/03/26','RR/MM/DD'),'Canada British Columbia','eddy@fss.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('Jamie','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','JamieCampbellBower','jamie.png','20210310_222836826_246.png','915484322','01022224545','M',to_date('88/11/22','RR/MM/DD'),'UK Greater London','jamie@fss.com',to_date('21/03/10','RR/MM/DD'),'N','A');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('jinha','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김진하','김진하.png','20210311_154042697_765.png','M11211312','01011121112','M',to_date('94/02/28','RR/MM/DD'),'인천 미추홀구','jinha@fss.com',to_date('21/03/11','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('hyunjin','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서현쥔','서현쥔.jpg','20210310_213022732_740.jpg','M70686098 ','01016486743','F',to_date('93/03/04','RR/MM/DD'),'서울시 중랑구','hyunjin@naver.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('hyoshin','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박흐신','박흐신.jpg','20210310_213522634_269.jpg','M70619098','01031500386','M',to_date('82/06/23','RR/MM/DD'),'대전광역시','hyoshin@naver.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('noah','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','NoahCentineo','noah.png','20210310_222231816_321.png','C01540218','01011459997','M',to_date('96/05/08','RR/MM/DD'),'USA Florida Miami','noah@fss.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('rnflfl','QBsJ6rPAE9TKVJIruAK+yP1TGBkrCnXyAdizcnQpCA+zN1kavT5ERTuVRVW3oIEuEIHDm3QCk/dl6ucx9aZe0Q==','김구리','propro.jpg','20210312_033942268_646.jpg','M99997777','01099995555','M',to_date('96/10/23','RR/MM/DD'),'강원도 속초','rnflfl@naver.com',to_date('21/03/12','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('ghgh','QBsJ6rPAE9TKVJIruAK+yP1TGBkrCnXyAdizcnQpCA+zN1kavT5ERTuVRVW3oIEuEIHDm3QCk/dl6ucx9aZe0Q==','사영','myTwo.jpg','20210312_035135597_346.jpg','93838788','01099997777','M',to_date('89/10/16','RR/MM/DD'),'충청남도 보령','dudfl@naver.com',to_date('21/03/12','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('dudfl','z0wKYovzTnt+3cS9l2X85saJTsUyuM5fQ/MUyXJ7mMpWJBnXbxXH2ECcslEyN9ukrYy639H8trzZjYaqwGmxBw==','사영리',null,null,'M78182536','01029370612','M',to_date('97/04/07','RR/MM/DD'),'서울특별시 관악구 남현동','dudfl@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('tndud','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김수영','myThree.jpg','20210311_184614332_944.jpg','M97391872','01030190407','F',to_date('87/07/14','RR/MM/DD'),'경기도 수원시 원천대로 3','tndud@naver.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('ghktk','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','안혜진','hwasa.png','20210311_184655472_315.png','M12383356','01023934117','F',to_date('95/07/23','RR/MM/DD'),'강원도 양양군 성내리','ghktk@naver.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('guti','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','구티에레츠','구티에레츠.jpg','20210310_213202461_990.jpg','M70681098','01053152314','M',to_date('98/07/23','RR/MM/DD'),'부산광역시 동구','guti@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('woosik','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','최우식','woosik.jpg','20210311_184741615_219.jpg','M99127765','01093071721','M',to_date('90/03/26','RR/MM/DD'),'경상남도 진주시 상대동','woosik@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('park','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박보용','박보용.jpg','20210310_213402351_202.jpg','M70689598','01031531583','F',to_date('89/06/23','RR/MM/DD'),'서울시 노원구','park@naver.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('miketyson','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','마이크타이슨','img1.daumcdn.gif','20210311_123615303_529.gif','11591981','01012341234','M',to_date('94/02/10','RR/MM/DD'),'New York','mike@naver.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('biggy','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','비기','download.jpg','20210310_214023539_910.jpg','8998489','01012341234','M',to_date('93/06/05','RR/MM/DD'),'Hell','biggy@la.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('kanyewest','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','칸예','download.jpg','20210310_214233172_545.jpg','123185943','01059484847','M',to_date('87/02/04','RR/MM/DD'),'Chicago ','kanye@naver.com',to_date('21/03/10','RR/MM/DD'),'N','G');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('suunho','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김선호','ssun.png','20210310_214531123_340.png','m12345555','01080729501','M',to_date('91/02/12','RR/MM/DD'),'Seoul','sunho@gmail.com',to_date('21/03/10','RR/MM/DD'),'N','H');
Insert into FSS1234.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PROFILE_ORIGINAL_FILE_NAME,PROFILE_RENAMED_FILE_NAME,MEMBER_PASSPORT,PHONE,GENDER,BIRTH,MEMBER_ADDRESS,MEMBER_EMAIL,MEMBER_ENROLL_DATE,MEMBER_DEL_FLAG,MEMBER_ROLE) values ('choijun','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','최준','choiJun.png','20210310_221504187_833.png','M14527844','01088541245','M',to_date('87/02/08','RR/MM/DD'),'서울 동대문구','jun@fss.com',to_date('21/03/10','RR/MM/DD'),'N','H');
REM INSERTING into FSS1234.PLACE
SET DEFINE OFF;
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_114','place_05_01.jpg','20210310_225518097_567.jpg','[이태원 펜트하우스 한강뷰 테라스] 40평대',5,'서울','서울 용산구 서빙고로79가길',300000,10,'잠실 롯데타워부터 남산까지 파노라마 한강뷰를 가지고 있는 용산 펜트하우스입니다.
인터뷰,매거진,드라마 촬영장소로만 사용하다 처음으로 에어비앤비에 선보입니다.
대리석 인테리어, 편안한 10인용 쇼파,분리된 다이닝 공간 및 빌트인 에어컨이 있는 5베드룸에서 충분한 휴식을 경험해보세요.
이태원 / 한남동의 맛집이 모두 배달되며 서울 어느곳이든 빠른 시간안에 갈 수 있습니다.
☆기물 파손 및 이웃집의 피해를 드릴 수 없기에 "단체 혼숙" 은 받지 않습니다☆',5,'취식,와이파이,주차장,에어컨','N','gonghangdodook');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_121','jeju1-1.jpg','20210310_231115826_684.jpg','[NEW OPEN] 마당에 감귤나무가 있고, 제주바다와 15분거리',4.5,'제주','제주 제주시 임향로17',55000,2,'**코로나-19 방역지침에 준수하여 퇴실 후 소독하고 있습니다.**

안녕하세요 반갑습니다. 제주에 방문해주셔서 감사합니다.
한번쯤 아늑한 숙소에서 혼자 또는 친구와의 추억을 만들고자 제주를 찾는 분들께서 만족하실 만한 숙소를 만들고자 노력했습니다.
좋은 추억 만드시고 가시는데 함께하게 되어 영광입니다.',2,'와이파이,주차장,바베큐장,에어컨','N','hyunjin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_125','place_12_01.jpg','20210310_231835622_403.jpg','Luxury Healing House',4.5,'서울','서울 용산구 녹사평대로40길',130000,2,'2 MINS walking distance to ITAEWON Main Street(clubs, restaurants, bars, pubs) and all public transportations(taxis, bus-stops, subway).
-Located at the connection point between Gyeongnidan Gil and Itaewon
-녹사평역에서 도보 5분거리 입니다. 경리단길 길가에 있어 찾기 쉽고 경리단길과 이태원 연결지점에 위치해 있습니다.-
-이태원 메인거리에서 밤늦게 오셔도 가깝고 밤에는 조용하고 안전합니다.
-핫한 디저트카페, 브런치집, 라운지, 카페, 편의점등등 빌딩에서 나오면서부터 있습니다.
-Dessert cafes, brunch cafes, lounges, convenience stores are right outside a minute walking distance away from the building.',1,'취식,와이파이,에어컨','N','ghktk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_135','place_16_01.jpg','20210310_234538799_475.jpg','[독채] 소담스테이: 서울 중심에 위치한 모던 한옥 스테이',4,'서울','서울 마포구 마포대로14길',90000,4,'소담스테이는 공덕동 소담길 인근 주택가에 조용히 자리하고 있는 한옥입니다. 아침에는 환한 햇살이 마당에 내리쬐고, 비가 오는 날이면 가만히 빗소리를 듣기 좋은 집입니다. 이곳은 저희 부부가 조용히 주말을 보내고, 한옥을 경험하고 싶은 내국인과 외국인에게 공간을 내어주고자 마련하게 되었습니다.',2,'취식,와이파이,TV,컴퓨터','N','ghktk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_137','place_18_01.jpg','20210310_235950102_878.jpg','[독채한옥]경복궁역, 통인시장 인근의 아름다운 한옥',5,'서울','서울 종로구 자하문로17길',160000,2,'통인시장 골목을 따라 걷다보면 나타나는 ''민규당''은 낡은 한옥을 대규모 수선하여 재탄생한 한옥스테이 입니다. 거실의 통창 너머와 침실의 팔각창을 통해 한옥의 정취와 풍류를 즐겨보세요. 욕실에 준비된 편백(히노끼)나무 욕조에서 휴식을 취할 수 있으며 침실의 빔프로젝터를 통해 넷플릭스, 유튜브 등의 컨텐츠를 감상할 수 있습니다.

숙소
[공통]
- 에어컨 및 바닥난방
- 서까래를 비추는 간접등',1,'와이파이,에어컨','N','suunho');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_138','place_19_01.jpg','20210311_000117320_068.jpg','#무디플레이스 @이태원캠핑',4,'서울','서울 용산구 회나무로',120000,4,'잊지 못할 하루가 바로 여기서 시작됩니다.
Welcome to moodyplace!
#무디플레이스

**check point**

- 남산뷰가 보이는 단독 옥상루프탑
- 도심 속 캠핑/글램핑 가능
- 프라이빗한 바베큐 가능
- 바베큐전용 전기그릴 유상 제공
- 당일 즉시 예약 가능
- 무료 wi-fi & 셀프 체크인
- 이태원 경리단길 위치

숙소
[무디플레이스 in Itaewon]
남산타워가 보이는 경리단뷰에서 즐기는
도시캠핑 / 파티룸 / 이용해보세요 :)
',2,'취식,와이파이,주차장,바베큐장,TV,컴퓨터,에어컨','N','suunho');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_141','gangwon2-3.jpg','20210311_000522114_465.jpg','둥해바다가 내려다 보이는 숙소 501호',4,'강원','대한민국 강원도 동해시 평원1길',112000,2,'동해 바다뷰와 깔끔하고 모던한 인테리어 속에서 진정한 휴식을 취할 수 있도록 준비된 숙소 입니다.
침대에 누워 바다뷰를 보며 소돌해변의 바다소리를 가장 가까이서 들으면 편히 쉴 수 있습니다.

차로 10분 이내에 주문진 수산시장 , 주문진 해수욕장,버스정류장, 관광지 이동에 적합한 위치에 있습니다.
또한 숙소 바로 앞에 편의점도 있어 이용에 매우 편리합니다.

항상 이용해 주셔서 감사합니다^^',1,'와이파이,주차장,TV,에어컨','N','yoon');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_143','gangwon3-2.jpg','20210311_191108656_304.jpg','청초淸楚 _ 침대에서 바다를, 산바다호수 뷰맛집',4.5,'강원','대한민국 강원도 강릉시 해안로 406번길',78800,4,'* 코로나 살균 99.99% 인증받은 데일리전해수기로 매일 소독하고 있으며 비치도 해놓았습니다.

속초해수욕장, 고속버스터미널, 이마트, 외옹치항과 가까운 신축호텔 속초 더 블루테라입니다. 최고급 침대와 침구를 사용하여 여행 후 피곤한 여행객에게 편안한 잠자리를 제공합니다. 저희 숙소는 매일매일 세탁된 침구로 교체하고 있습니다. 

숙소에서 오션뷰, 씨티뷰, 레이크뷰, 마운틴 뷰 모두 감상 가능하며 테라스는 잠시 차 한잔의 여유를 할 수 있게 마련해놓았습니다.

 여행객을 위한 가이드북도 준비 할 예정이니 많은 이용 부탁드립니다.

와인잔은 파손 사례가 너무 많아 준비가 어렵습니다. 양해 부탁드립니다 :)',1,'취식,와이파이,주차장,TV,에어컨','N','yoon');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_107','place_01_01.jpg','20210310_224314899_065.jpg','이태원 해방촌 cozy 청춘별장',3,'서울','서울 용산구 용산동2가',36000,4,'이태원 해방촌에 위치한 프라이빗한 컨셉공간입니다.
고급스런 나무로 꾸며진 따뜻한 집입니다.
집안의 모든 공간을 새롭게 직접 리모델링했어요.
소중한 사람과 좋은 시간을 보내기 위한 아늑한 공간입니다.
바쁜 일상속에서 잠시 휴식을 즐기세요.
도심속의 별장에서 좋은 추억 만드시길 바랄게요!
주변에 편의점과 마트가 있고 작은 시장이 있어서
동네에서 모든 것이 구매가능합니다.
해방촌만의 분위기와 서울 도심의 뷰 맛집, 남산타워, 산책길
아기자기하게 특색있는 상점들 많은 관심부탁드립니다 :)',2,'취식,와이파이,주차장','N','park');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_109','place_02_01.jpg','20210310_224712107_087.jpg','쾌적한 더블룸/개별욕실',4.5,'서울','서울 마포구 동교로27길',30000,2,'* 최대수용인원: 2명
* 1 퀸 침대

* 에어컨/바닥난방
* 24시간 온수
* 냉장고
* 전기포트
* 금연객실
* 옷걸이
* 창문열림
* 유아 출입금지

* 헤어드라이어
* 슬리퍼
* 무료 와이파이',1,'와이파이,에어컨','N','alal');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_112','place_04_01.jpg','20210310_225252345_584.jpg','Cozy Garden House',5,'서울','서울 강남구 선릉로 119길',63000,4,'Seoul Vacation Guest House is an old two-story house which is renovated recently. I am an architect who is host of this house, living with my family in the first floor. The second floor, consists of 2 rooms, will be runed as guest house.

Seoul Vacation is not only located in nice location, but also very quiet and cozy. Especially, there is a cozy garden you can have a special time.

We welcome who are anticipating nature, warm, sunshine, delicious tea, friendly host and cozy space. You will experience best comfort and local culture that is impossible in any other place in Gangnam.

Seoul Vacation Guest House is looking forward for your visitation.


[From Incheon Airport]
* Take the 6703 airport bus (1st floor of arrivals, 5a,10b - located between gates 3 and 4)
* Bus runs from 5:00AM to 10:51PM in 40 min intervals
* Take the airport bus to "Ramada Hotel" (3st stop on the trip_60min)
* Walk to Seoul Vacation Guesthouse (7min)',2,'취식,와이파이,주차장,바베큐장,TV,에어컨','N','gonghangdodook');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_117','place_08_01.jpg','20210310_230324310_188.jpg','나무, 구름, 하늘 [독채]',3.5,'서울','서울 영등포구 영등포동8가',88000,6,'*숙소설명
-주택가에 있는 아주 조용하고 안전한 장소입니다.
-커다란 감나무와 하늘로 가득 차는 큰 유리창이 있습니다.
-고양이가 담벼락을 지나가거나 새들이 나무에서 쉬는 모습을 볼 수 있습니다.
-봄과 여름에는 푸른 잎사귀들을, 가을에는 익어가는 감들을, 겨울에는 눈이 쌓인 나무의 운치와 골목의 정취를 느낄 수 있습니다.
-푹 쉬다가 포근히 잠들고, 따뜻한 아침 햇살에 눈을 뜨게 되는 공간입니다.
-레인바스시스템과 호텔바스세트로 기분 좋은 샤워를 할 수 있도록 준비했습니다.
-100% 식물성 텐셀 침구류와 시그니처 퀸사이즈 침대, 다양한 조명으로 휴식공간을 조성했습니다.
-넷플릭스(결제 됨), 유튜브가 설치된 빔프로젝트가 있습니다.',1,'취식,와이파이,주차장,TV,에어컨','N','jds9501');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_119','place_10_01.jpg','20210310_230745443_699.jpg','북촌애',4.5,'서울','서울 종로구 창덕궁4길',75000,2,'도심 속의 아담한 한옥으로 약 70년이 지난 한옥입니다. 지난 11월에 보수 공사를 마치고서 한옥체험을 시작했습니다. 각방마다 기본 천장을 버리고 전통한옥의 천장을 만들어 보와 서까래가 보입니다. 전통한옥의 분위기를 느끼실 수 있습니다. 도심한옥이라 그리 크지는 않지만 아기자기하고 아늑한 분위기를 가지고 있습니다.

게스트 이용 가능 공간/시설
예약하신 방과 거실 그리고 아담한 마당과 주방을 이용하실 수 있습니다.',1,'취식,와이파이','N','jds9501');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_123','place_11_01.jpg','20210310_231537099_072.jpg','인왕산 개미마을 / 도심 속 힐링하우스',2.5,'서울','서울 서대문구 세검정로4길',60000,2,'서울시 시내 한복판 인왕산 자락에 위치한 개미마을 입니다.

집은 20평/ 마당 20평 정도로,
마당이 있어 맑은 공기 마시며 잠시 휴식하기에 좋습니다.
집 앞 바로 산책로도 있고, 인왕산 등반도 가능합니다.

시골집이라고 생각하시고
시골집의 정취를 느끼고 싶으시다면 추천드립니다.

숙소
저희집은 4,5,6월/9,10월이 가장 지내기 좋습니다^^

에어컨은 없지만 인왕산에서 시원한 바람이 내려와
여름에도 서늘합니다. (선풍기는 있습니다)

겨울에는 따뜻함이 부족하다고 느끼실 수 있기 때문에
겨울에 지내길 원하신다면 따뜻한 옷은 필수로 준비해주셔요:)

기본적인 생활에 필요한
그릇, 주방집기류, 세탁기는 모두 갖췄습니다.

위 내용을 참고 하시어 예약 해주세요 :)

도심 속 힐링하우스로 오세요^^',1,'취식,와이파이,주차장,바베큐장','N','jds9501');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_124','jeju3-1.jpg','20210310_231703390_344.jpg','제주도 애월읍 공기좋은 숙소#애월읍#Aewol',3.5,'제주','제주 제주시 애월읍 애월로 1길 19-8',67000,2,'근처 새별오름,
곽지해수욕장, 한라산영실 진입로
등등 가능
다수의 맛집도 있어요

장기간계약 경우 하계에는 전기료가 동계에는 난방비가 추가
될 수 있습니다^^
주방용품과 세제류등이 구비되어있어
최소한의 물품만 가져오셔도
한달살이가 가능합니다.',1,'취식,와이파이,주차장,바베큐장,TV,에어컨','N','hyunjin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_130','place_14_01.jpg','20210310_233030470_201.jpg','Ja-un-dang 자운당 慈雲堂',4,'서울','서울 종로구 북촌로11길',650000,4,'Jaundang was built in 1930 and newly renovated in 2011 by a renown Hanok carpenter Jeong Yeongsoo and an architect Kim Taek. It is separated between the 1st floor which is a Korean traditional house, Hanok, and downstair is equipped with modern amenities.
Jaundang is located in heart of Bukchon Hanok Village surrounded by Gyeongbokgung Palace, Changdeokgung Palace and Jongmyo Shrine, and home to hundreds of traditional houses, called hanok, that date back to the Joseon Dynasty.',3,'취식,와이파이,주차장,바베큐장,TV,컴퓨터,에어컨','N','ghktk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_131','place_15_01.jpg','20210310_234004860_370.jpg','Private Hanok House at Gyeongbokgung',4,'서울','서울 종로구 자하문로1길',38000,8,'지친 일상에서 떠나 머무시는 동안 편안한 휴식이 되길 기원합니다.

숙소
코로나 바이러스 방지를 위해 숙소내 손 소독제를 비치해두었으며,
객실 및 공간 청소시 매회 살균 소독제를 사용하여 꼼꼼히 소독 후 환기하고 있습니다.

하우스 서촌은 종로구청에서 관광사업등록증 및 한옥 체험업으로 승인을 받은 한옥으로
안심하고 이용 하실 수 있는 숙소입니다.
또한 현관에는 디지털 도어락이 설치되어 있으며 각 객실에는 손전등, 화재경보기, 일산화탄소감지기가 설치되어 있고, 소화기가 내부와 외부에 구비되어 있습니다.',6,'취식,와이파이,주차장','N','ghktk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_136','place_17_01.jpg','20210310_235009638_462.jpg','뚝섬유원지역 도보 2분 (신규!)',4.5,'서울','서울 광진구 자양 4동',16500,1,'쾌적하고 편안한 소형 원베드룸 스튜디오를 소개해드립니다.
최근 리모델링을 완료하여 깨끗하고 쾌적하며, 주변에 편의시설이 많아 거주가 편리합니다..
궁금한 점은 편하게 문의주세요.',1,'취식,와이파이,TV,컴퓨터','N','ghktk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_139','place_20_01.jpg','20210311_000300919_507.jpg','통유리 창문과 테라스가 있는 햇살좋은 방',5,'서울','서울 용산구 후암로 60',100,4,'*2인기준~최대4인사용가능(추가비용1인1만원)
* 비밀번호 도어락
* KT 기가인터넷 Wifi 제공
*KT 올레티비 250체널
* 전자렌지/쿡탑/냉장고/전기포트 제공
* 냄비, 후라이팬은 제공 (생선구이류 .삼겹살,바베큐 등은 금지/ 연기 많이 나지않는 간편조리식 가능)
* 각 방 개별 세탁기 (장기투숙시에만 사용부탁 )
* 화장실 세면도구(샴푸/린스/바디워시) 제공
* 수건 치약제공',3,'취식,와이파이,TV,에어컨','N','suunho');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_140','place_21_01.jpg','20210311_000444128_435.jpg','연남입구#1514(Yeon-nam entrance#1514)',3,'서울','서울 마포구 양화로21길',85000,3,'안녕하세요 게스트님^^
연남입구 호스트입니다!

정말 제가 거주한다고 생각하고 정성스럽게 인테리어하고 심여를 기울여 준비한 공간입니다.
사진보다 실제가 훨씬 예쁘고 분위기가 좋다고 자부합니다! 이용하셨던 게스트님들께서도 모두 그러셨구요!!!
항상 청결하게 제가 이용한다는 마음가짐으로 정성스럽게 세팅할것을 약속 드립니다!
잘 부탁 드립니다^^

*건물내 주차가능
주차가 필요하신 분은 입차 시간부터 24시간 건물 주차장에 주차가 가능하고 주차요금 5,000원이 추가로 발생됩니다.',2,'취식,와이파이,주차장,TV,에어컨','N','choijun');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_142','서울22_1.jpg','20210311_000558881_719.jpg','취운정 스파 스위츠 바이 락고재',4,'서울','서울특별시 종로구 가회동',330000,2,'진정한 휴식과 쉼의 공간

편백나무로 만든 욕조, 그 안에서 바라보는 정원의 그림같은 모습, 취운정은 자연과 하나되는 순간과 휴식을 선사해 드립니다. 아름다운 경험을 위한 섬세한 배려로 취운정을 기억하시길 바랍니다.

북촌 가회동에 있는 취운정 역시 경복궁과 창경궁 사이에 자리해 있습니다. 취운정은 왕이 궁궐을 나설 때 머물렀던 정자인 취운정이 근처에 있어서 붙여진 이름입니다. 북촌에 터를 잡은 명문세가들 역시 이곳에서 정치와 문화, 예술을 꽃피웠습니다.',1,'와이파이,주차장,TV,에어컨','N','choijun');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_147','gangwon4-2.jpg','20210311_013608663_041.jpg','[힐링숲속]개별테라스 앞에 계곡이 흐르고~ 다락방 *바베큐',5,'강원','강원도 춘천시 신북읍 맥국길',99000,4,'**안녕하세요^^
숲으로 둘려쌓여있어 휴식할수는 특별한 공간을 찾아 헤매다 "여기다~~" 느낌 확오는 곳에 새롭게오픈했습니다~~

**힐링이 컨셉이며
집앞에 계곡과 산책할 수있는 산책로가 있으며
룸앞 데크에서 숲과 하늘과 신선한 공기와 물소리 새소리를 만날수 있으십니다.

**숲속의 정취를 느끼며 힐링가능하시고 차로 10분이면 
대형슈퍼와 Tv에 방영된 맛집 관광지 10분거리에서 누릴수 있습니다.
',2,'취식,와이파이,주차장,TV,컴퓨터,에어컨','N','yoon');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_151','jeolla3-3.jpg','20210311_155606732_405.jpg','데이위크 [Day;and] 감성충전! 디자이너집에서 살아보기',4.5,'전라','전라북도 남원시 금하정 2길',56000,5,'핸드드립 커피 한잔과 빈티지 음악으로 여유를 즐기시길 추천 드립니다.

데이앤드는 인테리어 디자이너의 집 입니다.

“여행은 살아보는거야!!!”
가족, 연인, 친구들과의 여행에 적합합니다!

추억을 만들 수 있는 숙소.',2,'취식,와이파이,주차장,바베큐장,TV,에어컨','N','park');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_152','gyeongsang2-1.jpg','20210311_030029098_725.jpg','#오션뷰#바다와#도보3분# 인생샷을 건지실 수 있어요^^',4.5,'경상','경상남도 창원시 마산합포구 오동동 14길',73000,3,'안녕하세요 저희 숙소를 찾아주시는 모든 고객님들께 감사합니다^^
해수욕장 바로 앞에 위치한 숙소입니다. 숙소에서  선위대교 정면뷰를 보실 수 있습니다.
잔잔한 파도소리와 선위대교 야경 보시면서 힐링하세요 :)
',1,'취식,와이파이,바베큐장,TV,에어컨','N','jaesuk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_153','gyeongsang3-1.jpg','20210311_030151209_422.jpg','[가족 및 여성전용] 숨어 있는 집/애완동물금지/실내흡연금지',4.5,'경상','경상북도 창원시 마산합포구 합포로',48000,5,'작은 정원이 예쁜 집입니다. 계절마다 다른 꽃들이 피어납니다.
깨끗한 공기, 별이 보이는 하늘.
은행나무길과 넓게 펼쳐진 논밭, 들판과 산을 보며 산책하기 좋은 조용한 마을에 위치하고 있습니다.
시끌벅적한 중심 관광지를 벗어나 좋은 풍경과 함께 편안히 머물다 가실 분에게 추천합니다.',1,'취식,와이파이,주차장','N','jaesuk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_224','gyeonggi1-1.png','20210311_154413835_085.png','[상시 소독중] ★공원전망 집★역과 도보5분★',0,'경기','대한민국 경기도 파주시 문산읍 독서울3길',49000,2,'◆ 집 앞의 공원을 숙소 내에서 조망 가능
◆ 가까운 명일전통 시장과 먹거리&쇼핑거리
◆ 면 100% 이불커버(겨울철 오리털 담요)
- 이불배게 커버는 손님마다 세탁 사용
◆ 역에서 차로 15분

',1,'와이파이,주차장,TV,에어컨','Y','dudfl');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_235','place_01_01.jpg','20210311_121151358_043.jpg','이태원 해방촌 cozy 청춘별장',0,'서울','서울 용산구 용산동2가',36000,4,'이태원 해방촌에 위치한 프라이빗한 컨셉공간입니다.
고급스런 나무로 꾸며진 따뜻한 집입니다.
집안의 모든 공간을 새롭게 직접 리모델링했어요.
소중한 사람과 좋은 시간을 보내기 위한 아늑한 공간입니다.
바쁜 일상속에서 잠시 휴식을 즐기세요.
도심속의 별장에서 좋은 추억 만드시길 바랄게요!
주변에 편의점과 마트가 있고 작은 시장이 있어서
동네에서 모든 것이 구매가능합니다.
해방촌만의 분위기와 서울 도심의 뷰 맛집, 남산타워, 산책길
아기자기하게 특색있는 상점들 많은 관심부탁드립니다 :)',2,'취식,와이파이,주차장','C','guti');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_236','place_02_01.jpg','20210311_121340930_507.jpg','쾌적한 더블룸/개별욕실',0,'서울','서울 마포구 동교로27길',30000,2,'* 최대수용인원: 2명
* 1 퀸 침대

* 에어컨/바닥난방
* 24시간 온수
* 냉장고
* 전기포트
* 금연객실
* 옷걸이
* 창문열림
* 유아 출입금지

* 헤어드라이어
* 슬리퍼
* 무료 와이파이',1,'와이파이,에어컨','C','guti');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_157','gyeongsang4-3.jpg','20210311_030430415_253.jpg','Artist House 깔끔하고 쾌적한 숙소를 원하시면 바로 이곳!',2.5,'경상','경상남도 창원시 마산합포구 동성동',34000,7,'7명도 수용가능한 넓은 거실
넉넉한 주차공간
조리도구 완비
모든 핫플레이스가 10분내 인 최고의 접근성
무료 와이파이
호텔급 침구류
삼성 공기청정기 제공',2,'취식,와이파이,주차장,바베큐장','N','jaesuk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_159','chungcheong1-1.jpg','20210311_161142143_238.jpg',' "독채"단독주택에서 특별한추억만들고 힐링하고가세요 ❤',4.5,'충청','충청남도 보령시 해수욕장4길 88',45000,5,'단독주택으로 프라이빗하게 즐기실 수 있습니다. 
산골마을 프라이빗하게 즐기실 수있습니다. 집들이 서로 떨어져있고, 유동인구가 없습니다. 넒은 마당과 바베큐를 즐길수 있는 시설, 바로 옆 작은 계곡, 걸어서 산책을 즐길수 있는 소나무 길까지 제대로 힐링을 즐기실 수 있습니다. 큰 킹사이즈 침대 하나와 거실과 주방 욕실로 이루어져 있습니다. 항상 깨끗하게 청소,소독하며 매번 새 이불을 사용하고 있습니다.기본적인 양념 또한 제공되고 있습니다. 도시와 단절되어 유유자적한 휴가를 즐겨보세요.
',2,'취식,와이파이,바베큐장,TV,컴퓨터,에어컨','Y','hyoshin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_160','chungcheong2-1.jpg','20210311_154854399_584.jpg','[오션뷰&갯벌뷰]바다와 5분거리/노을이 아름다운 바닷가 뷰',5,'충청','충청남도 보령시 해수욕장4길 74',85000,3,'감성충만한 공간에서 좋은 추억으로 기억되길 바랍니다^-^ 
코로나 바이러스로 불안한 요즘 안심하고 지낼 수 있도록 숙소 실내와 침구 모두 소독하고 있습니다!
잠시라도 편안히 쉬다갈 수 있는 공간이었으면 좋겠습니다•_•
',1,'취식,와이파이,주차장,바베큐장,에어컨','N','hyoshin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_162','chungcheong3-2.jpg','20210311_015725963_437.jpg','태안 오션뷰 숙소#태안#오션뷰#최고전망',5,'충청','충청남도 태안군 근흥면',49000,5,'넓은 주차 공간과 한적하고 공해 없는 주변환경을 가지고 있습니다.',2,'취식,와이파이,주차장,바베큐장,에어컨','N','hyoshin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_163','jeju5-2.jpg','20210311_005043002_586.jpg','[오소록 하우스]',4,'제주','제주',47000,2,'''오소록'' 이라 함은 제주도 방언으로, 숨겨진
아늑한 곳이라는 뜻을 담고 있습니다.

편안함과 안락함을 추구하는 ''오소록 하우스''.
오시는 모든 분들 모두를 환영합니다 :) ',2,'취식,와이파이,TV,에어컨','N','hyunjin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_189','jeolla3-3.jpg','20210311_025351144_721.jpg','cozy hanokstay',0,'전라','전라북도 전주시 완산구 팔달로',42000,4,'50년 이상된 한옥에 코지&빈티지의 감성을 더해 재해석한 숙소입니다. 
전통과 한국적 매력이 있는 도시, 지역성을 담고 싶었습니다.
우리는 이곳에서 그동안 잊고살았던 스스로를 되돌아 보는 계기가 되는 공간이면 좋겠습니다.

전통적인 한옥의 서까래, 대들보, 기둥, 구조목 등은 고스란히 계승하고, 현대인들이 사용하기 편한 시설과 빈티지&코지의 인테리어를 담아 소박한 모던 한옥 숙소입니다.',2,'와이파이,주차장,TV,에어컨','Y','park');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_237','gyeongsang1-3.jpg','20210311_122221454_851.jpg','[루크하우스] 60평 대가족도 환영합니다. 기차역과 10분거리',0,'경상','경상남도 창원시 마산합포구 해안대로 367',130000,10,'루크하우스는 합법적숙소로 등록되어 있으며
인테리어는 물론 사고를 미연에 방지하기 위한 화재감지기,소화기,방염벽지,셀프인덕션,대형 가스그릴 등 안전을 위한 준비가 되어있습니다.
화재및재난보험 가입완료.

최고의 조망과 야경을 즐길수 있는 루크 펜트하우스에서 잊지못할 추억을 만드세요
기본숙박 인원은 4명이며, 최대 숙박인원은 10인 입니다.
여분의 푹신한 메트리스와 포근한 침구가 제공 됩니다.

모던한 실내와 쾌적한 공간을 제공합니다.
가족, 연인, 단체, 파티, 이벤트(생일,돌잔치, 프로포즈, 브라이덜 샤워, 베이비샤워)에 적합합니다',4,'취식,와이파이,주차장,바베큐장,TV,컴퓨터,에어컨','C','jaesuk');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_239','jeju4-1.jpg','20210311_124621751_499.jpg','제주와와는 휴식이 필요한 여러분들을 위한 공간입니다.',0,'제주','제주 제주시 애월읍 곽지9길 8',58000,3,'*안내사항*
2021년 주택신축공사로 인해 소음이 발생할 수 있습니다.

편의시설, 위치, 가격 모두 만족할 수 있는 숙소로 여러분을 초대합니다.

숙소 주변에는 저지오름과 올레길 13코스, 14-1코스가 있고 차량으로10분~15분 거리에 생각하는 정원,유리의 성, 오설록과 신화역사공원, 국제영어교육도시 등이 있으며, 

또한 한림공원, 협재, 금릉해수욕장도 가까이에 있어 편리하게 이용할 수 있습니다.',2,'취식,와이파이,바베큐장,에어컨','C','hyunjin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_102','gangwon1-1.jpg','20210311_000231824_225.jpg','#속초항과 가까운 위치#바다뷰#편의점 2분거리',4,'강원','대한민국 강원도 속초시 청호로',87600,3,'"나에게 있어 여행이란 어디론가 가기 위해서가 아니라 그냥 떠나는 것이다.
나는 여행 자체를 목적으로 한다. 가장 큰일은 내 몸을 움직이는 것이다."
- 로버트 루이스 스티븐슨 -

저의 숙소는 강원도 등대와 가까운 곳에 있습니다.
걸어서 등대까지 도보로 가실 수 있어요. 숙소와 등대에서 보는 동해 바다는 너무 아름답습니다. ^^
아늑한 숙소에서 바라보는 낮과 밤의 바다뷰를 보면서 도시에서 쌓인 스트레스를 확~ 풀어 보세요. 

세월의 흔적이 있는 아파트를 작은 것 하나까지 제 손으로 수리하고 새것으로 교체했습니다. 
주변이 매우 조용하여 혼자만의 힐링 시간을 가지는 것도 좋습니다. 

혼자 여행하기도 참 좋은 곳이며, 혼자서 셀카 및 논골담길로 산책으로 바다를 다녀오는 것도 추천합니다.',1,'취식,와이파이,주차장,TV,에어컨','N','yoon');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_110','gyeonggi3-2.jpg','20210310_225054152_626.jpg','전망좋고 깨끗한 모던 하우스#강남과 근접',4.5,'경기','대한민국 경기 용인시 수지구 수지로 125',84400,3,'* 매번 새로 삶음 세탁한 침구, 쿠션, 수건류와 일회용 어메니티를 제공합니다~
(1인 예약하셔도 인원수에 무관하게 침구/수건 등은 2인 기준으로 준비해 드립니다 ^^)

* 통창에 내리쬐는 태양열을 막고 프라이버시를 지키는 썬팅과 암막커튼이 있습니다.

- 1주 이상 숙박하시는분께 무료주차를 제공 합니다.
- 단기 숙박시 24H 무료주차티켓 (선착순)을 제공합니다.',1,'와이파이,주차장,TV,에어컨','N','dudfl');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_111','place_03_01.jpg','20210310_225109129_346.jpg','[UH SUITE]#더서울#객실 내 풀스파',4.5,'서울','서울 중구 만리재로37길',320000,4,'#4인이 지내시기에 적합한 스위트룸입니다.
#객실 내 수영장이 있습니다. (온수는 숙박 중 1회 사용가능합니다)
#냉장고, 전자레인지 구비되어있습니다.
#케이블TV(넷플릭스 시청 가능합니다)
#퀸 사이즈 침대 2개
#4인용 식탁
#에어컨(냉난방기)
#다리미/드라이기, 샴푸/린스/바디샴푸/비누, 수건, 일회용 칫솔&치약 / 생수 등 구비되어 있습니다
#리셉션 데스크 운영시간은 10:00 ~ 19:00 입니다.
#건물 내 주차불가 합니다(도보 1분 거리에 있는''실로암사우나'' 주차장에 유료주차 가능합니다-1일권 1만원)',2,'취식,와이파이,TV,에어컨','N','gonghangdodook');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_113','gyeonggi2-1.png','20210310_225435626_425.png','나무향기를 가까이서 느끼실 수 있습니다.[실내단독]',5,'경기','대한민국 경기도 파주시 문산읍 독서울1길',71000,5,'서울 남단에 위치 해 사통팔달 전국 어디에서든 접근성이 최상이며 서울 도심의 편의시설 이용이 편리하고 전원의 맛을 흠뿍 느낄 수 있는 곳이랍니다.

주위에는 예쁜 꽃들과 나무가 어우러져 있고 파릇파릇한 잔디밭이 있어 편안한 마음이 드실겁니다. 
집 앞뜰 텃밭에는 무공해로 키운 여러 종류의 싱싱한 채소가 자라고 제철 채소는 오시는 분께 조금씩은 제공하겠습니다

집 내부는 편백나무 아카사아 멀바우 등 원목 나무들로 목수인 주인이 직접 가구를 제작 하여 집에 들어서는 순간, 깊은 숲속에 들어 온 듯한 자연풍의 나무향기를 느낄 수 있습니다.

이곳이 바로 여러분의 휴식처 입니다.

* 고객님의 안전을 위하여 숙소 주변에 CC-TV가 24시간 작동 중에 있습니다.',2,'취식,와이파이,주차장,바베큐장,에어컨','N','dudfl');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_115','place_06_01.jpg','20210310_225710199_638.jpg','Your beautiful long term nest, cosy & memorable',4,'서울','서울 마포구 양화로 7안길',25000,2,'WECOME TO YOUR LONG TERM NEST IN HONGDAE!
* Free wifi + TV
* Recently refurbished, perfectly well furnished, cozy & entirely private studio
* 5 min walk to the heart of Hongdae & 25 min to Sinchon
* 3rd floor of a 5-story very recent "villa" building with elevator
* VERY clean, new, comfortable room & bedding
* Floor heating, air conditioner, 24h hot water
* Kitchen : microwave, kettle, electric range, plenty of kitchen utensils, fire extinguishers
* Bathroom : soap, shampoo & body wash, towels, hair dryer
* Lot of storage space (several closets with hangers), lamps, spring bottled water, coffee, tea
* Digital door lock',1,'취식,와이파이,TV,에어컨','N','gonghangdodook');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_116','place_07_01.jpg','20210310_225851500_362.jpg','서촌유닛(Sechon Unit)-종로구,경복궁역,서촌',4,'서울','서울 종로구 옥인길',75000,2,'숙소
서촌유닛은 경복궁역 서촌에 위치하고 있는
1층에서 5개의 계단을 내려가면 만나볼 수 있는 공간입니다 서촌유닛에서 편안한 휴식과 여유를 느끼시길 소망합니다

기타 주의사항
주차공간이 없습니다 대중교통을 이용해 주세요
실내에서는 절대 금연입니다.',1,'취식,와이파이','N','gonghangdodook');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_118','place_09_01.jpg','20210310_230548072_400.jpg','minihanok classic (독채, 코로나19 방역 소독 철저)',3.5,'서울','서울 종로구 북촌로6길',170000,2,'북촌에 1920년대 지어진 작은 한옥을 조형미술가와 건축가 부부가 10여년 동안 거주하며 현대적인 감각으로 리모델링한 모던 한옥입니다.

1920년대의 목구조가 아직 남아있는 북촌의 몇 안 되는 소박한 한옥 안에 물푸레 원목 가구와 함께 쾌적하고 편안한 휴식공간을 제공합니다.

도심 속에서 여유를 찾는 소중한 경험이 될 수 있도록 노력하겠습니다.

숙소
mini Hanok classic is Korean Traditional House
(Entire House Rent)


mini hanok classic has one bedroom,1 bathroom,1 living room,1 kitchen and 1 garden.



Free internet
Room heating, bathroom heating, hot water, hair dryers, air-conditioners, shampoo, body soap and towels are supplied.



집 전체(한옥독채)를 자기집 처럼 편하게 사용할 수 있습니다. 취사가 가능하고 독립된 작은 마당이 있습니다.',1,'취식,와이파이,주차장,TV','N','jds9501');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_251','20210311_184655472_315.png','20210311_202634649_107.png','dd',0,'서울','dd',123,1,'adsdraeraer',3,'바베큐장','C','admin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_242','chungcheong1-1.jpg','20210311_161705073_022.jpg',' "독채"단독주택에서 특별한추억만들고 힐링하고가세요 ❤',0,'충청','충청남도 보령시 해수욕장4길 67',45000,5,'단독주택으로 프라이빗하게 즐기실 수 있습니다.
 
집들이 서로 떨어져있고, 유동인구가 없습니다. 
넒은 마당과 바베큐를 즐길수 있는 시설, 바로 옆 작은 계곡, 걸어서 산책을 즐길수 있는 소나무 길까지 제대로 힐링을 즐기실 수 있습니다.

@깨끗하게 이용 부탁드립니다@',2,'취식,와이파이,주차장,바베큐장,에어컨','Y','hyoshin');
Insert into FSS1234.PLACE (PLACE_ID,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLACE_NAME,PLACE_SCORE,PLACE_LOC,PLACE_ADDR,PLACE_PRICE,PLACE_AVAIL_COUNT,PLACE_NOTE,PLACE_ROOM_COUNT,PLACE_FACILITY,PLACE_DEL_FLAG,HOST_MEMBER_ID) values ('place_244','chungcheong1-1.png','20210311_162231068_296.png',' "독채"단독주택에서 특별한추억만들고 힐링하고가세요 ❤',0,'충청','충청남도 보령시 해수욕장4길 676',45000,5,'넒은 마당과 바베큐를 즐길수 있는 시설, 걸어서 산책을 즐길수 있는 소나무 길까지 제대로 힐링을 즐기실 수 있습니다. 
기본적인 양념 또한 제공되고 있습니다. 도시와 단절되어 유유자적한 휴가를 즐겨보세요.

@깨끗하게 이용 부탁드립니다@',2,'취식,와이파이,주차장,바베큐장,에어컨','C','hyoshin');
REM INSERTING into FSS1234.PLAY
SET DEFINE OFF;
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_193','예술의전당','5-1.jpg','20210311_113347272_279.jpg','한국사체험',4.5,'서울','서울특별시 마포구 삼개로2길 1, 2층 (도화동)',22000,3,4,'한국어, 영어','한국의 유명한 고궁 경복궁을 체험하며 한국의 역사에 대해서 알아볼 수 있습니다.',null,null,'마포역 3번출구 도보 15분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_185','제주 해율','bulloon.png','20210311_111814124_783.png','제주 오름 열기구 체험',5,'제주','제주도 서귀포시 대정읍',35000,2,6,'한국어,영어','천혜의 섬 제주도에서 오름을 배경으로 약 두시간동안 하늘 위에서 아름다운 경치를 즐길 수 있습니다.
약 13년 경력의 현지가이드가 생생하게 전달하는 제주의 역사를 들으며, 하늘에서 색다른 제주를 경험하세요!','무알콜 스파클링와인',null,'와우리 하차 후 도보 10분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_192','강원 관광청','surfing.png','20210311_113157683_675.png','양양 일일 서핑체험',4.5,'강원','강원도 양양군 서파리',55000,4,4,'한국어,영어','요즘 떠오르는 핫플레이스 양양에서 파도를 제대로 즐겨보세요','하이네켄 맥주','수영복, 샤워도구, 선크림','서울에서 양양 방향 15번국도 약 1시간 내외 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_194','강원 농수산 지원센터','gamja3.png','20210311_113420243_625.png','감자 캐기 체험',3.5,'강원','강원도 대관령 양현리11',10000,3,4,'한국어','강원도의 자랑! 강원도의 명물! 감자에 한 번 푹 빠져보세요!','감자로 만든 모든것','편한 운동화','대관령 목장 방향 버스 13번 이용','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_195','코레일관광개발','6-1.jpg','20210311_113443944_340.jpg','철도 체험',2.5,'서울','서울특별시 용산구 동자동 42-205',15000,2,4,'한국어, 영어','철도의 풍부한 인프라를 활용하여 다양한 체험의 장을 제공하여 2012 대한민국 교육기부 대상을 수상하였습니다.',null,null,'서울역 1번출구 도보 7분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_196','전쟁기념사업회','7-1.jpg','20210311_113712583_520.jpg','전쟁기념관 관람',4.5,'서울','서울특별시 용산구 용산동 2가 7',15000,2,8,'한국어, 영어','서울의 중심, 용산에 위치한 전쟁기념관은 전쟁을 단일 주제로, 5천년 민족사를 조망한 대한민국 유일의 전쟁사 종합박물관입니다.

 선열들의 위국헌신을 기리고, 전쟁의 참상을 통해 평화의 소중함을 배우는 호국안보 교육도장입니다. ',null,null,'삼각지역 4번출구 도보 3분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_197','대한체육회','20210311_113811714_464.jpg','20210311_151632648_862.jpg','전통 스포츠 체험 박람회',5,'서울','서울특별히 종로구 신문로 2가 1-130',8000,3,4,'한국어, 영어',' 태권도·씨름·검도·궁도·국학기공·줄다리기·줄넘기 등 총 8개의 대한체육회 회원종목단체가 참가해 체험 부스를 운영합니다. 또 행사 기간 중 종목별 시범단이 공연을 선보일 예정이라 박람회 참가자에게는 전통 종목에 대해서 알아보고 직접 체험하고 느낄 수 있는 특별한 기회가 될 것으로 기대합니다!
','null','null','경복궁역 3번출구 도보 3분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_198','한국문화 역사 지리학회','goindol3.png','20210311_114427680_718.png','선사시대 고인돌 문화 체험',4,'충청','충청북도 청주시 고양리',5000,2,2,'한국어','선사시대의 생활상을 엿볼 수 있는 고인돌 문화 체험입니다
','물',null,'청주버스터미널에서 픽업 차량 이용 가능(매 시 정각)','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_199','대한적십자사','9-1.jpg','20210311_114608684_872.jpg','재난안전센터 체험',3,'서울','서울특별시 노원구 상계동 755',10000,2,4,'한국어, 영어',' 우리는 기후변화와 전쟁, 자연재난, 신종전염병 등 예측하지 못한 각종 어려움에 직면하고 있습니다.
특히 재난은 갈수록 복잡, 다양해지고 그 피해 규모도 커지고 있습니다. 때문에 재난발생 시 신속한 구호활동과 이재민의 고통경감은 무엇보다 중요한 인도주의 활동이자 가치입니다.',null,null,'중계역 5번출구 도보 9분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_200','충청북도 지역 문화 지원센터','mud3.png','20210311_114716260_211.png','보령 머드 축제',4,'충청','충청북도 보령시 안암리',35000,4,4,'한국어,영어','보령의 하이라이트! 머드에 흠뻑 젖어
보세요!','하이네켄 맥주','수영복, 샤워도구, 선크림','보령IC에서 자차 이용시 20분 정도 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_204','국민체육진흥공단','12-1.jpg','20210311_115831938_182.jpg','전통혼례축제',4.5,'서울','서울특별시 송파구 잠실4동 올림픽로  420 올림픽회관',25000,2,4,'한국어, 영어','한국의 전통적인 혼례에 대해서 알아볼 수 있습니다.
',null,null,'길음역 3번출구 도보 7분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_205','제천 농림문화 지원센터','farm.png','20210311_120612638_306.png','제천 농촌 체험',4.5,'충청',' 충청북도 제천군 양감리11',15000,3,2,'한국어','우리가 먹는 쌀, 농산물이 어떻게 자라나지 직접 체험하며 배울 수 있는 체험입니다','점심 제공','여벌의 옷','영등포역에서 제천역까지 약 두시간 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_206','코레일관광개발','13-1.png','20210311_120709709_502.png','전통한복체험',3.5,'서울','서울특별시 용산구 동자동 42-205',15000,2,4,'한국어, 영어','대한민국의 전통적인 의복인 한복에 대해서 체험하는 시간을 가질 수 있습니다.',null,null,'서울역 1번출구 도보 7분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_207','한산 문화 역사단','mosi2.png','20210311_120904460_443.png','한산 모시체험',5,'충청','충청남도 서천군 한산리100',35000,4,4,'한국어','모시째기, 모시삼기, 모시날기 등 인류무형문화유산 한산모시짜기에 대해 각 과정별 배워 한산모시짜기에 대해 쉽고 친근하게 다가갈 수 있고, 과정교육을 모두 체험시 수료증 또한 발급 가능합니다
','물','염색할 여분의 천',' 서천종합버스터미널에서 10번 버스 이용시 약 20분 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_208','한국건설기술연구원','14-1.jpg','20210311_120944149_132.jpg','한국 한옥 박물관 체험',5,'경기','경기도 고양시 일산서구 고양대로 282(대화동) ',25000,2,4,'한국어, 영어','한국의 전통적인 가옥인 한옥에 대해서 알아보고, 각 시대별 한옥의 특징 및 건축 방법 등 다양한 정보를 알아볼 수 있습니다.
',null,null,'킨텍스 제1 전시장정류장 하차 후 도보 18분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_209','한국디자인진흥원','15-1.jpg','20210311_121040191_377.jpg','"한국의 전통적인 디자인 체험 "',4,'경기','경기도 성남시 분당구 양현로 322 코리아디자인센터',15000,2,4,'한국어, 영어','한국의 의, 식, 주에 사용된 전통적인 디자인에 대해서 알아볼 수 있습니다.
',null,null,'성남터미널정류장 하차 후 도보 15분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_214','농업기술실용화재단','18-1.jpg','20210311_121912068_687.jpg','"한국의 전통 농사 체험 "',3,'경기','경기도 수원시 권선구 수인로 126(서둔동253) ',15000,2,4,'한국어, 영어','한국의 전통적인 농사 기법들을 체험할 수 있습니다.
',null,null,'웃거리정류장 하차 후 도보 10분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_183','제주 한라봉 홍보청','hanlabong.png','20210311_102136229_035.png','제주 한라봉 따기 체험',4.5,'제주','제주도 제주시 봉동읍',15000,2,2,'한국어','약 두시간동안 제주의 자랑, 한라봉을 맘껏 따고 먹고 즐길 수 있습니다! 제주에서만 즐길 수 있는 한라봉을 마음껏 즐겨보세요','한라봉으로 만든 모든것',null,'서귀포 공항에서 픽업 차량 이용가능','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_211','한국마사회','16-1.jpg','20210311_121136515_259.jpg','한국의 도심승마체험',4.5,'경기','경기도 과천시 경마공원대로 107',50000,2,4,'한국어, 영어','도심승마체험은 말산업 선도기관인 한국마사회가 건전한 여가 문화를 확산하고 도심 속에서 느끼는 승마의 즐거움을 알리기 위해 시행하고 있는 프로그램입니다 말산업 발전과 승마 산업의 활성화를 위해 앞으로도 지자체들과의 협력을 지속 강화해 나가겠습니다.
',null,null,'경마공원역 2번출구 도보 10분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_213','한국식품연구원','17-1.jpg','20210311_121809664_368.jpg','한국음식 관광 박람회',4,'경기','경기도 성남시 분당구 안양판교로 1201번길 62',50000,2,4,'한국어, 영어','한국음식관광박람회는 요리경연대회 및 전시로 한식세계화, 한식 관광자원화를 통한 외식산업 및 음식문화 발전을 도모하기 위한 박람회로 한국음식문화의 우수성을 직접 체험해볼 수 있고, 음식과 관련된 다양한 볼거리를 제공하는 박람회입니다.
',null,null,'범계역 하차 후 도보 20분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_221','전라도 문화 재청','tea.png','20210311_123148699_769.png','한국 전통 차 체험',4,'전라','전라남도 보성 녹차밭',20000,3,2,'한국어,영어','녹차로 만든 모든것을 체험 할 수 있습니다. 찻 잎 재배부터 다도까지! 
녹차의 중심, 보성에서 체험하세요','녹차, 녹차전','필기도구, 편한 신발','보성 기차역에서 약 20분 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_225','거제도 홍보센터','fishing2.png','20210311_125031406_023.png','거제도 배 낚시 체험',3,'경상','경상남도 거제도 거제거리',45000,4,2,'한국어','거제 앞바다에서 배낚시를!','해물라면','멀미약','거제항에서 도보 20분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_187','한국해양조사협회','2-1.jpg','20210311_112352806_394.jpg','갯벌 체험',3,'서울','서울특별시 금천구 가산동 505-14',25000,2,4,'한국어, 영어','한국해양조사협회는 서울 근교의 마시안갯벌체험장에서 갯벌 체험을 할 수 있는 기회를 제공하고자 합니다. 
한국해양조사협회 정문에 모여서 버스를 타고 이동할 예정입니다. 
아이에게 가족과 함께하는 소중한 추억을 만들어주세요.','칼국수, 조개구이','여벌의 옷','가산디지털단지역 3번 출구 도보 4분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_188','한국체육산업개발','3-1.jpg','20210311_112504155_638.jpg','한국 전통 민속놀이 체험',4,'서울','서울특별시 송파구 방이동 87',20000,2,4,'한국어, 영어','한국의 전통적인 민속놀이인 투호, 널뛰기, 팽이치기 등 다양한 놀이를 체험해볼 수 있습니다.',null,null,'올림픽공원역 2번 출구 도보 10분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_203','국립 충주 기상 박물관','science2.png','20210311_114856234_700.png','기상 과학관 체험 ',3.5,'충청','충청북도 충주시 남연로124 ',12000,2,4,'한국어,영어','놀라운 속도로 발전하고 있는 한국의 과학 기술과 기상학의 발전을 직접 눈으로 보고 체험 할 수 있습니다! 
','물','필기도구, 편한 신발','충주IC에서 22번 버스 이용시 약 30분 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_212','천안 역사박물관','korea3.png','20210311_121339656_659.png','독립기념관 역사 체험',4,'충청','충청남도 천안시 독립 기념관로',15000,2,4,'한국어',' "거래의 얼"과 "한국의 빛"이 살아있는 뜨거운 역사의 현장인 독립기념관은 민족의 자주와 독립을 지켜온 우리 민족의 국난극복사와 국가발전사에 관한 자료를 수집·보존·전시·조사·연구함으로써 민족문화의 정체성을 확립 하고 국민의 투철한 민족정신과 국가관을 정립하는데 이바지함을 목적으로 건립되었습니다. 한국의 살아있는 역사와 한민족의 얼을 느낄 수 있는 천안 독립기념관을 체험해보세요!.
','물','필기도구, 편한 신발','천안역에서 15번 버스 이용시 10분 내외 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_215','한국문화진흥주식회사','19-1.jpg','20210311_122001671_060.jpg','한국의 전통 문화 체험',3.5,'경기','경기도 광주시 삼지곡길 92 뉴서울컨트리클럽',15000,2,4,'한국어, 영어','한국의 전통적인 문화에 대해서 체험할 수 있습니다.
',null,null,'갈마주유소 하차 후 도보 15분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_222','통영 욕지도 관광청','monorail.png','20210311_124347320_077.png','욕지도 모노레일 체험',3,'경상','경상남도 통영시 통영마을',15000,1,4,'한국어','떠오르는 핫 플레이스!
욕지도의 절경과 통영 앞바다를 바라보며 모노레일에서 인생샷!을  건져보세요',null,null,'통영에서 배타고 약 30분 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_223','밀양 홍보재청','berry2.png','20210311_124610387_511.png',' 딸기 따기 체험',4,'경상','경상남도 밀양시 딸기마을',35000,3,4,'한국어','겨울의 맛 딸기에 흠뻑 빠져 보고 싶으신가요? 딸기로 만든 모든것을 맛볼 수 있습니다! 딸기 주스, 스무디, 케이크 등등 각종 딸기디저트를 신선한 딸기로 즐겨보세요!','딸기로 만든 모든것','편한 운동화','밀양 기차역에서 도보 20분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_226','경남 지역자연지원 센터','pink3.png','20210311_125259431_443.png','함안 핑크뮬리 체험',5,'경상','경상남도 함안군 핑크리',100,1,2,'한국어','떠오르는 핫플레이스! 함안의 핑크 빛 자랑 핑크뮬리 밭에서 인생샷을 찍어가세요!',null,null,'남서울 IC에서 8번국도 이용시 약 3시간 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_184','한국공항공사','1-1.jpg','20210311_105702004_420.jpg','20시간 한국 여행',4,'서울','서울특별시 강서구 하늘길 79(과해동)',50000,20,1,'한국어, 영어','한국공항공사는 김포국제공항을 이용해 최단시간 한국여행에 도전하는 체험형 이벤트인 ‘코앞에 김포공항, 
20시간 한국여행’을 진행할 예정입니다. 이달 18일까지 공사 페이스북(www.facebook.com/airport.korea)을 통해 
김포국제공항에서 취항하는 6개의 도시(서울, 제주, 전북, 부산, 강원, 춘천)로 
‘24시간 국내여행’을 떠날 20명의 지원자를 선발해 왕복 항공권(1인 1매)을 저렴한 가격으로 판매하는 행사입니다.','전주비빔밥, 갈비 등','여벌의 옷, 간단한 생필품','김포공항역 7번출구 도보 7분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_186','제주관광청','horse2.png','20210311_140545578_245.png','제주 오름 승마체험',5,'제주','제주도 제주시 해안로',25000,2,2,'한국어','말과 친해지는 방법부터 올라타고, 달리는 방법은 물론 사진과 동영상 기록까지 남겨드립니다! 제주도에서 이색적인 경험을 해보세요','물','편한 운동화','제주공항에서 2000번 버스 이용 후 제주승마장에서 하차','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_189','예술의전당','4-1.jpg','20210311_112603765_341.jpg','미술, 문화 전시 체험',5,'서울','서울특별시 마포구 삼개로2길 1, 2층 (도화동) ',20000,3,4,'한국어, 영어','미술·문화 전시체험은 예술의 전당, 국립중앙박물관 기획전시실, 세종문화회관 미술관, 국립현대미술관, 서울시립미술관, 서울미술관 등 서울 주요 미술관, 박물관의 특별전 전시 체험 프로그램입니다.',null,null,'마포역 3번출구 도보 15분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_191','강원 지역 관광청','kanu2.png','20210311_112912122_461.png','소양강 카누 체험',4,'강원','강원도 소양강',25000,2,2,'한국어','강원도의 중심 줄기인 소양강애서 고즈넉한 분위기를 즐겨보세요',null,null,'서울에서 양양 방향 15번국도 약 1시간 내외','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_201','한국방송광고진흥공사','10-1.jpg','20210311_114725324_855.jpg','전통시장 체험',3,'서울','서울특별시 중구 태평로 1가 24',20000,2,4,'한국어, 영어','한국의 전통적인 시장을 체험할 수 있습니다.
',null,null,'시청역 5번출구 도보 10분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_202','국민체육진흥공단','11-1.jpg','20210311_114822246_366.jpg','효문화체험',3,'서울','서울특별시 송파구 잠실4동 올림픽로  420 올림픽회관',15000,2,4,'한국어, 영어','한국의 효 문화를 체험할 수 있습니다.
',null,null,'길음역 3번출구 도보 7분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_217','전라도 관광 홍보청','cheese2.png','20210311_122208153_468.png','임실 치즈 마을 체험',4.5,'전라','전라남도 임실군',50000,4,4,'한국어,영어','한국에서 가장 큰 치즈 마을 !
치즈로 만든 모든것을 즐기러 오세요','치즈로 만든 모든것',null,'남서울 IC에서 약 4시간 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_218','전라남도 지역 문화재청','sky.png','20210311_122425977_272.png','고흥 짚라인 체험',5,'전라','전라남도 고흥군 사창면',30000,1,2,'한국어','하늘위에서 바라보는 고흥의 절경과 정취를 느껴보세요!','물','편한 운동화','고흥 고속버스터미널에서 택시 이용후 30분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_219','죽녹원','bamboo2.png','20210311_122704150_465.png','담양 대나무숲 체험 ',5,'전라','전라남도 담양시 죽녹로11',13000,2,2,'한국어','울창하게 펼쳐진 대나무숲에서 맑은 공기와 더불어 대나무를 이용한 각종 체험을 즐겨보세요!','점심 제공(대나무 밥)',null,'담양역에서 13번 버스 이용시 10분 내외 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_220','전주 전통문화 연수원','culture2.png','20210311_122917712_982.png','전통문화 체험',4,'전라','전라북도 전주시 전주한옥마을',22000,2,2,'한국어,영어','전주의 중심, 전주 한옥마을에서 한국의 깊은 역사와 문화를 체험 할 수 있습니다','초코바','필기도구, 편한 신발','전주 기차역에서 약 15분','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_232','대한민국 외교지원 사업부','dokdo.png','20210311_164926819_912.png','대한민국의 섬, 독도 체험',3,'경상','경상북도 울릉군 독도',100000,5,4,'한국어, 영어','대한민국의 역사, 대한민국의 천연기념물 독도를 여행하며 동해의 깊은 자연을 만끽해보세요
',null,null,'포항항에서 배로 약 5시간 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_233','국립 경주 박물관','history.png','20210311_165045343_698.png','경주 신라역사 체험',4,'경상','경상북도 경주시 울주군',35000,4,4,'한국어, 영어','신라 천년의 고도 경주에서 역사의 숨결을 느껴보세요.  세계문화유산에 등재된 신라 최고의 불교문화재인  불국사와 석굴암, 역사의 한 페이지인 첨성대와 동궁과 월지를 둘러보며 천년의 역사를 배우는 시간을 갖을 수 있습니다
',null,null,'남경주역에서 20번 버스 이용시 약 15분 소요','N');
Insert into FSS1234.PLAY (PLAY_ID,COMPANY,THUMBNAIL_ORIGINAL_FILENAME,THUMBNAIL_RENAMED_FILENAME,PLAY_NAME,PLAY_SCORE,PLAY_LOC,PLAY_ADDR,PLAY_PRICE,PLAY_TIME,PLAY_AVAIL_COUNT,PLAY_LANGUAGE,PLAY_NOTE,PLAY_FOOD,PLAY_EQUIPMENT,PLAY_TRANSPORT,PLAY_DEL_FLAG) values ('play_190','강원 불교 문화 사업단','temple.png','20210311_112646625_745.png','낙산사 템플스테이',3,'강원','강원도 양양군 강현면',70000,20,2,'한국어,영어','템플스테이는 1700년 한국불교의 역사와 문화가 살아 숨 쉬는 산사에서 수행자의 일상을 경험하는 전통문화체험 프로그램입니다. 바쁜 일상에서의 잠깐의 휴식. 1박2일동안 낙산사의 절경을 느끼면서 마음의 휴식을 얻어가세요!
 낙산사 템플스테이는 휴식형과 체험형 두가지 중 선택가능합니다. 자세한 내용은 하단의 정보를 참고해주세요','사찰음식','여벌의 옷','서울에서 양양방향 7번국도 약 1시간 소요','N');
REM INSERTING into FSS1234.REGISTRATION
SET DEFINE OFF;
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311223',2,to_date('21/03/11','RR/MM/DD'),to_date('21/05/12','RR/MM/DD'),to_date('21/05/15','RR/MM/DD'),'Y','N','bill',null,'place_124');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('no20210311226',1,to_date('21/03/11','RR/MM/DD'),to_date('21/03/27','RR/MM/DD'),to_date('21/03/29','RR/MM/DD'),'N','C','noah',null,'place_163');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('no20210311227',3,to_date('21/03/11','RR/MM/DD'),to_date('21/06/29','RR/MM/DD'),to_date('21/06/30','RR/MM/DD'),'N','C','noah',null,'place_139');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('no20210311228',2,to_date('21/03/11','RR/MM/DD'),to_date('21/03/12','RR/MM/DD'),to_date('21/03/13','RR/MM/DD'),'N','C','noah',null,'place_125');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('no20210311230',1,to_date('21/03/11','RR/MM/DD'),to_date('22/02/13','RR/MM/DD'),to_date('22/02/15','RR/MM/DD'),'N','C','noah',null,'place_115');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311246',1,to_date('21/03/11','RR/MM/DD'),to_date('21/03/20','RR/MM/DD'),to_date('21/03/22','RR/MM/DD'),'N','C','bill',null,'place_140');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ji20210311243',1,to_date('20/03/11','RR/MM/DD'),to_date('20/05/09','RR/MM/DD'),to_date('20/05/09','RR/MM/DD'),'Y','N','jinha','play_193',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ji20210311242',1,to_date('21/03/11','RR/MM/DD'),to_date('21/05/09','RR/MM/DD'),to_date('21/05/09','RR/MM/DD'),'Y','N','jinha','play_193',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ed20210311220',2,to_date('21/03/11','RR/MM/DD'),to_date('21/05/11','RR/MM/DD'),to_date('21/05/13','RR/MM/DD'),'Y','C','eddy',null,'place_140');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311222',1,to_date('21/02/03','RR/MM/DD'),to_date('21/02/12','RR/MM/DD'),to_date('21/02/15','RR/MM/DD'),'Y','N','bill',null,'place_163');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ji20210311240',1,to_date('21/01/02','RR/MM/DD'),to_date('21/01/05','RR/MM/DD'),to_date('21/01/05','RR/MM/DD'),'Y','N','jinha','play_226',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ka20210311203',1,to_date('20/12/01','RR/MM/DD'),to_date('20/12/22','RR/MM/DD'),to_date('20/12/24','RR/MM/DD'),'Y','C','kanyewest',null,'place_139');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ka20210311204',1,to_date('21/03/11','RR/MM/DD'),to_date('21/03/14','RR/MM/DD'),to_date('21/03/20','RR/MM/DD'),'N','C','kanyewest',null,'place_147');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ka20210311206',2,to_date('21/03/11','RR/MM/DD'),to_date('21/07/18','RR/MM/DD'),to_date('21/07/20','RR/MM/DD'),'N','C','kanyewest',null,'place_139');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('tu20210311208',2,to_date('21/03/11','RR/MM/DD'),to_date('21/04/23','RR/MM/DD'),to_date('21/04/25','RR/MM/DD'),'N','C','tupac',null,'place_157');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('tu20210312252',1,to_date('21/03/12','RR/MM/DD'),to_date('21/03/18','RR/MM/DD'),to_date('21/03/18','RR/MM/DD'),'Y','N','tupac','play_226',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('jd20210311210',2,to_date('21/03/11','RR/MM/DD'),to_date('21/03/30','RR/MM/DD'),to_date('21/04/02','RR/MM/DD'),'N','C','jdsss',null,'place_162');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311211',1,to_date('21/01/03','RR/MM/DD'),to_date('21/01/12','RR/MM/DD'),to_date('21/01/15','RR/MM/DD'),'Y','N','bill',null,'place_147');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ka20210311212',1,to_date('21/03/11','RR/MM/DD'),to_date('21/04/25','RR/MM/DD'),to_date('21/04/26','RR/MM/DD'),'Y','C','kanyewest',null,'place_121');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ra20210311213',2,to_date('21/03/11','RR/MM/DD'),to_date('21/07/15','RR/MM/DD'),to_date('21/07/18','RR/MM/DD'),'N','C','rachel',null,'place_113');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ed20210311214',2,to_date('21/02/11','RR/MM/DD'),to_date('21/02/17','RR/MM/DD'),to_date('21/02/20','RR/MM/DD'),'Y','C','eddy',null,'place_113');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ed20210311215',4,to_date('19/05/18','RR/MM/DD'),to_date('19/07/03','RR/MM/DD'),to_date('19/08/03','RR/MM/DD'),'Y','C','eddy',null,'place_139');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('be20210311217',3,to_date('21/03/11','RR/MM/DD'),to_date('21/03/22','RR/MM/DD'),to_date('21/03/25','RR/MM/DD'),'Y','C','bewhy',null,'place_113');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('tu20210311218',1,to_date('21/03/11','RR/MM/DD'),to_date('21/05/05','RR/MM/DD'),to_date('21/05/08','RR/MM/DD'),'N','C','tupac',null,'place_110');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311221',2,to_date('21/01/01','RR/MM/DD'),to_date('21/01/02','RR/MM/DD'),to_date('21/01/03','RR/MM/DD'),'Y','N','bill',null,'place_121');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('no20210311229',2,to_date('21/03/11','RR/MM/DD'),to_date('21/06/20','RR/MM/DD'),to_date('21/06/21','RR/MM/DD'),'N','C','noah',null,'place_147');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ds20210311232',2,to_date('21/03/11','RR/MM/DD'),to_date('21/03/12','RR/MM/DD'),to_date('21/03/13','RR/MM/DD'),'N','C','dsds',null,'place_109');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ds20210311233',1,to_date('21/03/11','RR/MM/DD'),to_date('21/03/31','RR/MM/DD'),to_date('21/04/02','RR/MM/DD'),'N','C','dsds',null,'place_159');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ji20210311241',1,to_date('21/03/11','RR/MM/DD'),to_date('21/03/12','RR/MM/DD'),to_date('21/03/12','RR/MM/DD'),'Y','N','jinha','play_226',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ka20210311205',2,to_date('21/03/11','RR/MM/DD'),to_date('21/05/16','RR/MM/DD'),to_date('21/05/17','RR/MM/DD'),'N','C','kanyewest',null,'place_160');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('be20210311207',1,to_date('21/01/07','RR/MM/DD'),to_date('21/01/17','RR/MM/DD'),to_date('21/01/20','RR/MM/DD'),'Y','C','bewhy',null,'place_163');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ed20210311216',1,to_date('21/03/11','RR/MM/DD'),to_date('21/03/18','RR/MM/DD'),to_date('21/03/19','RR/MM/DD'),'N','C','eddy',null,'place_121');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('ed20210311219',2,to_date('21/03/11','RR/MM/DD'),to_date('21/03/31','RR/MM/DD'),to_date('21/04/01','RR/MM/DD'),'Y','C','eddy',null,'place_142');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('no20210311225',2,to_date('21/03/11','RR/MM/DD'),to_date('21/03/22','RR/MM/DD'),to_date('21/03/24','RR/MM/DD'),'N','C','noah',null,'place_121');
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311244',2,to_date('21/03/11','RR/MM/DD'),to_date('21/04/11','RR/MM/DD'),to_date('21/04/11','RR/MM/DD'),'Y','N','bill','play_190',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311245',4,to_date('21/03/11','RR/MM/DD'),to_date('21/07/01','RR/MM/DD'),to_date('21/07/01','RR/MM/DD'),'Y','N','bill','play_212',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311247',4,to_date('21/03/11','RR/MM/DD'),to_date('21/02/05','RR/MM/DD'),to_date('21/02/05','RR/MM/DD'),'Y','N','bill','play_183',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311248',4,to_date('21/03/11','RR/MM/DD'),to_date('21/01/01','RR/MM/DD'),to_date('21/01/01','RR/MM/DD'),'Y','N','bill','play_192',null);
Insert into FSS1234.REGISTRATION (REG_ID,GUEST_COUNT,REG_DATE,REG_CHKIN_DATE,REG_CHKOUT_DATE,REG_PAY_YN,REG_DEL_FLAG,REG_MEMBER_ID,PLAY_ID,PLACE_ID) values ('bi20210311249',4,to_date('21/03/11','RR/MM/DD'),to_date('21/02/09','RR/MM/DD'),to_date('21/02/09','RR/MM/DD'),'Y','N','bill','play_207',null);
--------------------------------------------------------
--  DDL for Index PK_BOARD_COMMENT_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "FSS1234"."PK_BOARD_COMMENT_NO" ON "FSS1234"."BOARD_COMMENT" ("BOARD_COMMENT_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PLACE_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "FSS1234"."PK_PLACE_ID" ON "FSS1234"."PLACE" ("PLACE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_PLAY_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "FSS1234"."PK_PLAY_ID" ON "FSS1234"."PLAY" ("PLAY_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_COMMENT_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "FSS1234"."PK_COMMENT_ID" ON "FSS1234"."COMMENT_TABLE" ("COMMENT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "FSS1234"."PK_MEMBER_ID" ON "FSS1234"."MEMBER" ("MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BOARD_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "FSS1234"."PK_BOARD_NO" ON "FSS1234"."BOARD" ("BOARD_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_REG_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "FSS1234"."PK_REG_ID" ON "FSS1234"."REGISTRATION" ("REG_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "FSS1234"."BOARD" ADD CONSTRAINT "PK_BOARD_NO" PRIMARY KEY ("BOARD_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FSS1234"."BOARD" ADD CONSTRAINT "CK_BOARD_DEL_FLAG" CHECK (BOARD_DEL_FLAG IN ('Y','N')) ENABLE;
  ALTER TABLE "FSS1234"."BOARD" MODIFY ("BOARD_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."BOARD" MODIFY ("BOARD_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."BOARD" MODIFY ("BOARD_TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IMAGESTORE
--------------------------------------------------------

  ALTER TABLE "FSS1234"."IMAGESTORE" MODIFY ("RENAMED_FILENAME" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."IMAGESTORE" MODIFY ("ORIGINAL_FILENAME" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."IMAGESTORE" MODIFY ("IMAGE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "FSS1234"."MEMBER" ADD CONSTRAINT "PK_MEMBER_ID" PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FSS1234"."MEMBER" ADD CONSTRAINT "CK_MEMBER_ROLE" CHECK (MEMBER_ROLE IN ('G','H','A')) ENABLE;
  ALTER TABLE "FSS1234"."MEMBER" ADD CONSTRAINT "CK_MEMBER_DEL_FLAG" CHECK (MEMBER_DEL_FLAG IN ('Y','N')) ENABLE;
  ALTER TABLE "FSS1234"."MEMBER" ADD CONSTRAINT "CK_GENDER" CHECK (GENDER IN ('M','F')) ENABLE;
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("MEMBER_EMAIL" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("MEMBER_ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("BIRTH" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("MEMBER_PASSPORT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REGISTRATION
--------------------------------------------------------

  ALTER TABLE "FSS1234"."REGISTRATION" ADD CONSTRAINT "PK_REG_ID" PRIMARY KEY ("REG_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FSS1234"."REGISTRATION" ADD CONSTRAINT "CK_REG_DEL_FLAG" CHECK (REG_DEL_FLAG IN ('Y','N','C')) ENABLE;
  ALTER TABLE "FSS1234"."REGISTRATION" MODIFY ("REG_MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."REGISTRATION" MODIFY ("REG_CHKOUT_DATE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."REGISTRATION" MODIFY ("REG_CHKIN_DATE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."REGISTRATION" MODIFY ("GUEST_COUNT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."REGISTRATION" MODIFY ("REG_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLACE
--------------------------------------------------------

  ALTER TABLE "FSS1234"."PLACE" ADD CONSTRAINT "PK_PLACE_ID" PRIMARY KEY ("PLACE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FSS1234"."PLACE" ADD CONSTRAINT "CK_PLACE_DEL_FLAG" CHECK (PLACE_DEL_FLAG IN('Y','N','C')) ENABLE;
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_FACILITY" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_ROOM_COUNT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_NOTE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_AVAIL_COUNT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_PRICE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_ADDR" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_LOC" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_NAME" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLACE" MODIFY ("PLACE_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "FSS1234"."BOARD_COMMENT" ADD CONSTRAINT "PK_BOARD_COMMENT_NO" PRIMARY KEY ("BOARD_COMMENT_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FSS1234"."BOARD_COMMENT" ADD CONSTRAINT "CK_BOARD_COMMENT_DEL_FLAG" CHECK (BOARD_COMMENT_DEL_FLAG IN ('Y','N')) ENABLE;
  ALTER TABLE "FSS1234"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_WRITER" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."BOARD_COMMENT" MODIFY ("BOARD_REF" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."BOARD_COMMENT" MODIFY ("BOARD_COMMENT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLAY
--------------------------------------------------------

  ALTER TABLE "FSS1234"."PLAY" ADD CONSTRAINT "PK_PLAY_ID" PRIMARY KEY ("PLAY_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FSS1234"."PLAY" ADD CONSTRAINT "CK_PLAY_DEL_FLAG" CHECK (PLAY_DEL_FLAG IN ('Y','N')) ENABLE;
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_NOTE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_LANGUAGE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_AVAIL_COUNT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_TIME" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_PRICE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_ADDR" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_LOC" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_SCORE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("PLAY_NAME" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."PLAY" MODIFY ("COMPANY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMMENT_TABLE
--------------------------------------------------------

  ALTER TABLE "FSS1234"."COMMENT_TABLE" ADD CONSTRAINT "PK_COMMENT_ID" PRIMARY KEY ("COMMENT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "FSS1234"."COMMENT_TABLE" ADD CONSTRAINT "CK_COMMENT_DEL_FLAG" CHECK (COMMENT_DEL_FLAG IN ('Y','N')) ENABLE;
  ALTER TABLE "FSS1234"."COMMENT_TABLE" MODIFY ("COMMENT_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."COMMENT_TABLE" MODIFY ("PRODUCT_REF" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."COMMENT_TABLE" MODIFY ("PRODUCT_SCORE" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."COMMENT_TABLE" MODIFY ("COMMENT_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."COMMENT_TABLE" MODIFY ("COMMENT_LEVEL" NOT NULL ENABLE);
  ALTER TABLE "FSS1234"."COMMENT_TABLE" MODIFY ("COMMENT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "FSS1234"."BOARD" ADD CONSTRAINT "FK_BOARD_WRITER" FOREIGN KEY ("BOARD_WRITER")
	  REFERENCES "FSS1234"."MEMBER" ("MEMBER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "FSS1234"."BOARD_COMMENT" ADD CONSTRAINT "FK_BOARD_COMMENT_WRITER" FOREIGN KEY ("BOARD_COMMENT_WRITER")
	  REFERENCES "FSS1234"."MEMBER" ("MEMBER_ID") ENABLE;
  ALTER TABLE "FSS1234"."BOARD_COMMENT" ADD CONSTRAINT "FK_BOARD_REF" FOREIGN KEY ("BOARD_REF")
	  REFERENCES "FSS1234"."BOARD" ("BOARD_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENT_TABLE
--------------------------------------------------------

  ALTER TABLE "FSS1234"."COMMENT_TABLE" ADD CONSTRAINT "FK_REG_PLACE_ID" FOREIGN KEY ("PLACE_ID")
	  REFERENCES "FSS1234"."PLACE" ("PLACE_ID") ENABLE;
  ALTER TABLE "FSS1234"."COMMENT_TABLE" ADD CONSTRAINT "FK_REG_PLAY_ID" FOREIGN KEY ("PLAY_ID")
	  REFERENCES "FSS1234"."PLAY" ("PLAY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table IMAGESTORE
--------------------------------------------------------

  ALTER TABLE "FSS1234"."IMAGESTORE" ADD CONSTRAINT "FK_IMG_PLACE_ID" FOREIGN KEY ("PLACE_ID")
	  REFERENCES "FSS1234"."PLACE" ("PLACE_ID") ENABLE;
  ALTER TABLE "FSS1234"."IMAGESTORE" ADD CONSTRAINT "FK_IMG_PLAY_ID" FOREIGN KEY ("PLAY_ID")
	  REFERENCES "FSS1234"."PLAY" ("PLAY_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLACE
--------------------------------------------------------

  ALTER TABLE "FSS1234"."PLACE" ADD CONSTRAINT "FK_HOST_MEMBER_ID" FOREIGN KEY ("HOST_MEMBER_ID")
	  REFERENCES "FSS1234"."MEMBER" ("MEMBER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REGISTRATION
--------------------------------------------------------

  ALTER TABLE "FSS1234"."REGISTRATION" ADD CONSTRAINT "FK_PLACE_ID" FOREIGN KEY ("PLACE_ID")
	  REFERENCES "FSS1234"."PLACE" ("PLACE_ID") ENABLE;
  ALTER TABLE "FSS1234"."REGISTRATION" ADD CONSTRAINT "FK_PLAY_ID" FOREIGN KEY ("PLAY_ID")
	  REFERENCES "FSS1234"."PLAY" ("PLAY_ID") ENABLE;
  ALTER TABLE "FSS1234"."REGISTRATION" ADD CONSTRAINT "FK_REG_MEMBER_ID" FOREIGN KEY ("REG_MEMBER_ID")
	  REFERENCES "FSS1234"."MEMBER" ("MEMBER_ID") ENABLE;
