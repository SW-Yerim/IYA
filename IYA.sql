-- 유저 테이블
CREATE TABLE iyauser (
    userID VARCHAR2(100) PRIMARY KEY,
    userPW VARCHAR2(100) NOT NULL,
    userPhone VARCHAR2(100) NOT NULL
);

SELECT * FROM iyauser;

INSERT INTO iyauser VALUES ('aaa', '1111', '01011111111');
INSERT INTO iyauser VALUES ('bbb', '1111', '01022222222');
INSERT INTO iyauser VALUES ('ccc', '1111', '01033333333');
INSERT INTO iyauser VALUESS ('ddd', '1111', '01044444444');
INSERT INTO iyauser VALUES ('eee', '1111', '01055555555');
INSERT INTO iyauser VALUES ('aaaa', '12341234', '01012341234');

SELECT * FROM iyauser;
SELECT * FROM iyauser WHERE NOT userID = 'aaa';
SELECT * FROM iyauser WHERE userID = 'aaa' AND userPW = '2222' AND userPhone = '010';
DELETE FROM iyauser WHERE userID='aaaa';

COMMIT;
 
 
-- 게시글 테이블
CREATE TABLE iyaboard (
    boardnum NUMBER PRIMARY KEY,
    userid VARCHAR2(100),
    cate1 NUMBER,
    cate2 NUMBER,
    boardtitle VARCHAR2(500),
    boardcontent VARCHAR2(4000),
    boardtime DATE DEFAULT sysdate,
    postup NUMBER,
    viewnum NUMBER
);
CREATE SEQUENCE boardnum START WITH 1 INCREMENT BY 1;

DROP TABLE iyaboard;
DROP SEQUENCE boardnum;

SELECT * FROM (SELECT ROWNUM rnum,a.* FROM (SELECT * FROM iyaboard a WHERE cate1=cate1 AND cate2=cate2 ORDER BY boardnum DESC )a ) WHERE rnum BETWEEN 1 AND 5;

COMMIT;

-- cate1 
-- 1:서울 / 2:인천 / 3:경기
-- cate2 
-- 1:맛집 / 2:관광지 / 3:교육 / 4:미용 / 5:자유게시판 / 6:질문과답변
-- 맛집
INSERT INTO iyaboard VALUES (boardnum.nextval, '홍길동', 1, 1, '최신 맛집 공유합니다!', '이번에 찾은 최신 맛집 aaa 공유해요~~', sysdate, 1, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'aaa', 1, 1, '새로 발견한 맛집!', '이번에 놀러갔다가 아무 곳이나 들어갔는데 너무 맛있었어요!', sysdate, 5, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '예리미', 1, 1, '어제 다녀온 식당~', '어제 예전에 자주 가던 식당에 오랜만에 다녀왔어요~ 역시 맛있더라구요!', sysdate, 1, 70);
INSERT INTO iyaboard VALUES (boardnum.nextval, '유리성', 1, 1, '나만 아는 맛집 공유합니다!', '나만 알고 있던 동네 맛집 공유합니다~', sysdate, 10, 100);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'HanF', 1, 1, '싸고 맛있는 식당 알려드려요~!', '가성비 최고인 식당 소개합니다~', sysdate, 20, 200);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'junny', 1, 1, '비싸지만 맛은 보장!', '가격은 조금 나가지면 맛은 보장인 식당입니다~', sysdate, 0, 30);

INSERT INTO iyaboard VALUES (boardnum.nextval, '천방지축', 2, 1, '김치찌개 맛집', '국물 최고~~', sysdate, 10, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '네뜨랑', 2, 1, '떡볶이', '매콤한게 땡길 땐 떡볶이~', sysdate, 40, 150);
INSERT INTO iyaboard VALUES (boardnum.nextval, '흐흐헤', 2, 1, '100% 자연치즈로 만든 피자', '쭉쭉 늘어나는 100% 자연산 치즈', sysdate, 0, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '지하땅굴', 2, 1, '김밥지옥', '김밥과 라면은 환상궁합', sysdate, 1, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, '행인이씨', 2, 1, '이순신핫도그', '갓 만들어 더 맛있는!', sysdate, 20, 130);
INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 2, 1, '원썸플레이스', '최고급 원두만 사용합니다', sysdate, 1, 40);

INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 3, 1, '주말엔 배달 맛집', '주말에는 손 하나 까딱하기 싫네요~ 이런 날은 포테킹 추천합니다!', sysdate, 0, 40);
INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 3, 1, '현지인이 추천하는 맛집 대방출', '10년 산 현지인이 추천하는 맛집', sysdate, 10, 350);
INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 3, 1, '돈까스 맛집 숑숑돈까스', '처음가봤는데 체인점이더라구요ㅋㅋ<br>근데 기대이상이엇음<br>돈까스는말해뭐해 어느집이든 다 맛있죵^^', sysdate, 20, 160);
INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 3, 1, '붕어빵 맛집', '슈크림 / 초코 / 팥<br>여러가지 맛이 있는 미니붕어빵 추천합니다!', sysdate, 10, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 3, 1, '맛이 끝내주는 돼지막창', '또 먹고싶다..', sysdate, 5, 240);
INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 3, 1, '쫀득이 마카롱 맛집', '쫀득이 마카롱 여기저기서 이야기가 들리는데 맛집 어디인가요?<br>검색해보니 서울쪽에 많던데<br>서울 사시는 분들 쫀득이 마카롱 맛집 어디가 괜찮나요?', sysdate, 10, 240);
INSERT INTO iyaboard VALUES (boardnum.nextval, '알하바드', 3, 1, 'ㄹㅇ 여기 맛집', '진짜 맛있음<br>후회안함', sysdate, 11, 244);

-- 관장지
INSERT INTO iyaboard VALUES (boardnum.nextval, '이시리나', 1, 2, '관광지 공유합니다!', '여기 가봤는데 참 좋네요!', sysdate, 10, 110);
INSERT INTO iyaboard VALUES (boardnum.nextval, '마켓w', 1, 2, '재미 보장 놀이공원!', '하나뿐인 놀이공원 놀러오세요~', sysdate, 0, 30);
INSERT INTO iyaboard VALUES (boardnum.nextval, '나찬찬', 1, 2, '힘들지 않은 산!', '경치 좋고 풍경좋은 산이에요~', sysdate, 40, 1200);

INSERT INTO iyaboard VALUES (boardnum.nextval, 'pdg123', 2, 2, '등산하기 좋은 곳', '맑은 공기 마시면서 같이 등산해요~', sysdate, 10, 220);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'hhp9314', 2, 2, '차이나 타운', '유니짜장이 맛있는 차이나타운으로 놀러오세요~', sysdate, 4, 230);
INSERT INTO iyaboard VALUES (boardnum.nextval, '구니스', 2, 2, '동화마을', '동심 가득한 동화마을~', sysdate, 0, 4);

-- 교육
INSERT INTO iyaboard VALUES (boardnum.nextval, '먹보', 1, 3, 'aa컴퓨터학원', '시설도 깨끗하고 최신형입니다!', sysdate, 3, 123);
INSERT INTO iyaboard VALUES (boardnum.nextval, '안질리나쫄면', 1, 3, '종미수학학원', '누구보다 빠르게 실력향상하는 수학학원!', sysdate, 2, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, '샤랄라뿡', 1, 3, '수미영어학원', '원어민 출신 강사있어요~', sysdate, 2, 45);
INSERT INTO iyaboard VALUES (boardnum.nextval, '행인이씨', 1, 3, '태권도도장', '20년 동안 운영해온 태권도 도장', sysdate, 0, 10);

INSERT INTO iyaboard VALUES (boardnum.nextval, '부츠카', 2, 3, '제과제빵학원 DDBB', '유명 빵집에서 원데이 클래스도 진행하네요', sysdate, 2, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '1004Bam', 2, 3, '김수학 학원', '초,중,고 수학 전문 학원', sysdate, 1, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'kiss9302', 2, 3, '기가스터디', '전 과목 내신을 한번에!', sysdate, 0, 40);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'soho24', 2, 3, '미용학원', '실무를 직접 경험하며 학습 할 수 있습니다', sysdate, 4, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'rlagotls', 2, 3, '세무, 회계', '자격증 위주', sysdate, 5, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '용의눈물', 2, 3, '킥복싱', '다이어트 킥복싱반 신규 모집', sysdate, 10, 40);

-- 미용
INSERT INTO iyaboard VALUES (boardnum.nextval, '지하땅굴', 1, 4, '미용실추천!', '여러 선생님이 있어서 원하는 스타일을 선택 할 수 있습니다!', sysdate, 10, 30);
INSERT INTO iyaboard VALUES (boardnum.nextval, '루미탄이', 1, 4, '하미네일!', '네일 받고 싶으면 여기로~', sysdate, 4, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '베리been', 1, 4, '호타가발!', '이제 머리 걱정하지 마세요~', sysdate, 10, 80);
INSERT INTO iyaboard VALUES (boardnum.nextval, '김중고2', 1, 4, '사사화장품!', '누구보다 산뜻하게~', sysdate, 3, 59);
INSERT INTO iyaboard VALUES (boardnum.nextval, '일팔광때엥', 1, 4, '향수전문점!', '당신이 원하는 향이 모두 있습니다.', sysdate, 3, 56);

INSERT INTO iyaboard VALUES (boardnum.nextval, '꼬마토끼', 2, 4, '성형외과', '쌍커풀 잘하기로 소문난 병원', sysdate, 1, 260);
INSERT INTO iyaboard VALUES (boardnum.nextval, '건우맘', 2, 4, '미용실', '이번에', sysdate, 5, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '두딸바보', 2, 4, 'ssss', '이번에', sysdate, 1, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'beat145', 2, 4, '최신', '이번에', sysdate, 30, 40);

-- 자유게시판
INSERT INTO iyaboard VALUES (boardnum.nextval, '김캉캉', 1, 5, '배고프다아...', '맛있는거....', sysdate, 0, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '내사랑함박꽃', 1, 5, '나 아는사람?', '나 아는 사람 없어?', sysdate, 0, 30);
INSERT INTO iyaboard VALUES (boardnum.nextval, '리치man', 1, 5, '게임추천좀요~', '재밌는 게임 추천 해주세요', sysdate, 4, 70);
INSERT INTO iyaboard VALUES (boardnum.nextval, '마파두부컵밥', 1, 5, '아이야 너무 좋아요~', '짱~!', sysdate, 200, 3000);
INSERT INTO iyaboard VALUES (boardnum.nextval, '민트별별', 1, 5, '드라마 추천!', '0000 엄청 재밌어요!', sysdate, 20, 560);

INSERT INTO iyaboard VALUES (boardnum.nextval, 'aaa', 2, 5, '오늘 점심은 다들 뭐 드시나요 ?', '매번 메뉴 고민하기 힘드네요~', sysdate, 30, 100);

-- 질문과답변
INSERT INTO iyaboard VALUES (boardnum.nextval, '산타할아버지', 1, 6, '토익 학원 추천좀요~', '좋은 토익학원 없나요 ?', sysdate, 3, 40);
INSERT INTO iyaboard VALUES (boardnum.nextval, '쿠크다스', 1, 6, '내일 놀러가는데 관광지 추천해주세요~', '좋은 곳 없을까요?', sysdate, 10, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '딸랑딸랑', 1, 6, '점심 추천해주세요~', '이따가 점심 먹어야하는데 메뉴 추천점요~', sysdate, 4, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '아녀녀녀녕', 1, 6, '11살이 다니기 좋은 학원 어디있을까요?', '수학 영어 두 곳 추천해주세요', sysdate, 2, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '핫dog', 1, 6, '아이들 몇살 부터 학원 다니나요?', '제 아이가 8살인데 언제부터 학원을 보내야 할까요??', sysdate, 0, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '라이거', 1, 6, '단발 머리 잘 해주는 미용실 추천해주세요!', '이번에 큰맘 먹고 단발로 자르려고 하는데 잘하는 미용실 추천해주세요~', sysdate, 0, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '수지네', 1, 6, '맛집 없어요??', '왜 내가 가는 곳은 다 맛없지?', sysdate, 10, 120);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'sangdy', 1, 6, '헬스장 추천점요~', '싸고 좋은 헬스장 추천해주세요~', sysdate, 2, 60);

INSERT INTO iyaboard VALUES (boardnum.nextval, 'aaa', 2, 6, '피부과 추천좀요!', '피부가 너무 상했어요 ㅠㅠ 괜찮은 피부과 추천좀 해주세요!', sysdate, 3, 68);

SELECT * FROM iyaboard;


-- 댓글 테이블
CREATE TABLE boardComment (
    boardnum NUMBER,
    groupNum VARCHAR2(100),
    sortNum NUMBER,
    userId VARCHAR2(100),
    cContent VARCHAR2(1000),
    cUp NUMBER,
    cDown NUMBER,    
    cDate DATE DEFAULT sysdate
);

COMMIT;


-- 추천 비추천 테이블
CREATE TABLE updown (
    boardNum number,
    userID VARCHAR2(100),
    updown number
);

INSERT INTO updown VALUES (1, 'bb', '1');
INSERT INTO updown VALUES (2, 'bbd', '1');
INSERT INTO updown VALUES (3, 'bbd', '1');
INSERT INTO updown VALUES (3, 'ba', '1');
INSERT INTO updown VALUES (4, 'ba', '1');
INSERT INTO updown VALUES (5, 'ba', '1');
INSERT INTO updown VALUES (6, 'a', '1');
INSERT INTO updown VALUES (7, 'a', '1');
INSERT INTO updown VALUES (8, 'aa', '1');
INSERT INTO updown VALUES (10, 'aa', '1');
INSERT INTO updown VALUES (11, 'aaa', '1');
INSERT INTO updown VALUES (12, 'aaa', '1');
INSERT INTO updown VALUES (13, 'aaa', '1');
INSERT INTO updown VALUES (4, 'aaa', '1');
INSERT INTO updown VALUES (5, 'aaa', '1');
INSERT INTO updown VALUES (6, 'aaa', '1');
INSERT INTO updown VALUES (7, 'aaa', '1');
INSERT INTO updown VALUES (8, 'aaa', '1');
INSERT INTO updown VALUES (4, 'aaaa', '1');
INSERT INTO updown VALUES (5, 'aaaa', '1');
INSERT INTO updown VALUES (6, 'aaaa', '1');
INSERT INTO updown VALUES (7, 'aaaa', '1');
INSERT INTO updown VALUES (8, 'aaaa', '1');
INSERT INTO updown VALUES (4, 'b', '1');
INSERT INTO updown VALUES (5, 'b', '1');
INSERT INTO updown VALUES (6, 'b', '1');
INSERT INTO updown VALUES (7, 'b', '1');
INSERT INTO updown VALUES (8, 'b', '1');
INSERT INTO updown VALUES (4, 'c', '1');
INSERT INTO updown VALUES (5, 'c', '1');
INSERT INTO updown VALUES (6, 'c', '1');
INSERT INTO updown VALUES (7, 'c', '1');
INSERT INTO updown VALUES (8, 'c', '1');
INSERT INTO updown VALUES (4, 'd', '1');
INSERT INTO updown VALUES (5, 'd', '1');
INSERT INTO updown VALUES (6, 'd', '1');
INSERT INTO updown VALUES (7, 'd', '1');
INSERT INTO updown VALUES (8, 'd', '1');
INSERT INTO updown VALUES (4, 'e', '1');
INSERT INTO updown VALUES (5, 'e', '1');
INSERT INTO updown VALUES (6, 'e', '1');
INSERT INTO updown VALUES (7, 'e', '1');
INSERT INTO updown VALUES (8, 'e', '1');
INSERT INTO updown VALUES (4, 'f', '1');
INSERT INTO updown VALUES (5, 'f', '1');
INSERT INTO updown VALUES (6, 'f', '1');
INSERT INTO updown VALUES (7, 'f', '1');
INSERT INTO updown VALUES (8, 'f', '1');
INSERT INTO updown VALUES (4, 'z', '2');
INSERT INTO updown VALUES (5, 'z', '2');
INSERT INTO updown VALUES (6, 'z', '2');
INSERT INTO updown VALUES (7, 'z', '2');
INSERT INTO updown VALUES (8, 'z', '2');
INSERT INTO updown VALUES (4, 'y', '2');
INSERT INTO updown VALUES (5, 'y', '2');
INSERT INTO updown VALUES (6, 'y', '2');
INSERT INTO updown VALUES (7, 'y', '2');
INSERT INTO updown VALUES (8, 'y', '2');

COMMIT;