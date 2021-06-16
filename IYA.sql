-- ���� ���̺�
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
 
 
-- �Խñ� ���̺�
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
-- 1:���� / 2:��õ / 3:���
-- cate2 
-- 1:���� / 2:������ / 3:���� / 4:�̿� / 5:�����Խ��� / 6:�������亯
-- ����
INSERT INTO iyaboard VALUES (boardnum.nextval, 'ȫ�浿', 1, 1, '�ֽ� ���� �����մϴ�!', '�̹��� ã�� �ֽ� ���� aaa �����ؿ�~~', sysdate, 1, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'aaa', 1, 1, '���� �߰��� ����!', '�̹��� ����ٰ� �ƹ� ���̳� ���µ� �ʹ� ���־����!', sysdate, 5, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '������', 1, 1, '���� �ٳ�� �Ĵ�~', '���� ������ ���� ���� �Ĵ翡 �������� �ٳ�Ծ��~ ���� ���ִ��󱸿�!', sysdate, 1, 70);
INSERT INTO iyaboard VALUES (boardnum.nextval, '������', 1, 1, '���� �ƴ� ���� �����մϴ�!', '���� �˰� �ִ� ���� ���� �����մϴ�~', sysdate, 10, 100);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'HanF', 1, 1, '�ΰ� ���ִ� �Ĵ� �˷������~!', '������ �ְ��� �Ĵ� �Ұ��մϴ�~', sysdate, 20, 200);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'junny', 1, 1, '������� ���� ����!', '������ ���� �������� ���� ������ �Ĵ��Դϴ�~', sysdate, 0, 30);

INSERT INTO iyaboard VALUES (boardnum.nextval, 'õ������', 2, 1, '��ġ� ����', '���� �ְ�~~', sysdate, 10, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '�׶߶�', 2, 1, '������', '�����Ѱ� ���� �� ������~', sysdate, 40, 150);
INSERT INTO iyaboard VALUES (boardnum.nextval, '������', 2, 1, '100% �ڿ�ġ��� ���� ����', '���� �þ�� 100% �ڿ��� ġ��', sysdate, 0, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���϶���', 2, 1, '�������', '���� ����� ȯ�����', sysdate, 1, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, '�����̾�', 2, 1, '�̼����ֵ���', '�� ����� �� ���ִ�!', sysdate, 20, 130);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 2, 1, '�����÷��̽�', '�ְ�� ���θ� ����մϴ�', sysdate, 1, 40);

INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 3, 1, '�ָ��� ��� ����', '�ָ����� �� �ϳ� ����ϱ� �ȳ׿�~ �̷� ���� ����ŷ ��õ�մϴ�!', sysdate, 0, 40);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 3, 1, '�������� ��õ�ϴ� ���� �����', '10�� �� �������� ��õ�ϴ� ����', sysdate, 10, 350);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 3, 1, '��� ���� �������', 'ó�����ôµ� ü�����̴��󱸿䤻��<br>�ٵ� ����̻��̾���<br>����¸��ع��� ������̵� �� ������^^', sysdate, 20, 160);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 3, 1, '�ؾ ����', '��ũ�� / ���� / ��<br>�������� ���� �ִ� �̴Ϻؾ ��õ�մϴ�!', sysdate, 10, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 3, 1, '���� �����ִ� ������â', '�� �԰�ʹ�..', sysdate, 5, 240);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 3, 1, '�˵��� ��ī�� ����', '�˵��� ��ī�� �������⼭ �̾߱Ⱑ �鸮�µ� ���� ����ΰ���?<br>�˻��غ��� �����ʿ� ������<br>���� ��ô� �е� �˵��� ��ī�� ���� ��� ��������?', sysdate, 10, 240);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ϲٵ�', 3, 1, '���� ���� ����', '��¥ ������<br>��ȸ����', sysdate, 11, 244);

-- ������
INSERT INTO iyaboard VALUES (boardnum.nextval, '�̽ø���', 1, 2, '������ �����մϴ�!', '���� ���ôµ� �� ���׿�!', sysdate, 10, 110);
INSERT INTO iyaboard VALUES (boardnum.nextval, '����w', 1, 2, '��� ���� ���̰���!', '�ϳ����� ���̰��� �������~', sysdate, 0, 30);
INSERT INTO iyaboard VALUES (boardnum.nextval, '������', 1, 2, '������ ���� ��!', '��ġ ���� ǳ������ ���̿���~', sysdate, 40, 1200);

INSERT INTO iyaboard VALUES (boardnum.nextval, 'pdg123', 2, 2, '����ϱ� ���� ��', '���� ���� ���ø鼭 ���� ����ؿ�~', sysdate, 10, 220);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'hhp9314', 2, 2, '���̳� Ÿ��', '����¥���� ���ִ� ���̳�Ÿ������ �������~', sysdate, 4, 230);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ͻ�', 2, 2, '��ȭ����', '���� ������ ��ȭ����~', sysdate, 0, 4);

-- ����
INSERT INTO iyaboard VALUES (boardnum.nextval, '�Ժ�', 1, 3, 'aa��ǻ���п�', '�ü��� �����ϰ� �ֽ����Դϴ�!', sysdate, 3, 123);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���������̸�', 1, 3, '���̼����п�', '�������� ������ �Ƿ�����ϴ� �����п�!', sysdate, 2, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, '�������', 1, 3, '���̿����п�', '����� ��� �����־��~', sysdate, 2, 45);
INSERT INTO iyaboard VALUES (boardnum.nextval, '�����̾�', 1, 3, '�±ǵ�����', '20�� ���� ��ؿ� �±ǵ� ����', sysdate, 0, 10);

INSERT INTO iyaboard VALUES (boardnum.nextval, '����ī', 2, 3, '���������п� DDBB', '���� �������� ������ Ŭ������ �����ϳ׿�', sysdate, 2, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '1004Bam', 2, 3, '����� �п�', '��,��,�� ���� ���� �п�', sysdate, 1, 10);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'kiss9302', 2, 3, '�Ⱑ���͵�', '�� ���� ������ �ѹ���!', sysdate, 0, 40);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'soho24', 2, 3, '�̿��п�', '�ǹ��� ���� �����ϸ� �н� �� �� �ֽ��ϴ�', sysdate, 4, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'rlagotls', 2, 3, '����, ȸ��', '�ڰ��� ����', sysdate, 5, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���Ǵ���', 2, 3, 'ű����', '���̾�Ʈ ű���̹� �ű� ����', sysdate, 10, 40);

-- �̿�
INSERT INTO iyaboard VALUES (boardnum.nextval, '���϶���', 1, 4, '�̿����õ!', '���� �������� �־ ���ϴ� ��Ÿ���� ���� �� �� �ֽ��ϴ�!', sysdate, 10, 30);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���ź��', 1, 4, '�Ϲ̳���!', '���� �ް� ������ �����~', sysdate, 4, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '����been', 1, 4, 'ȣŸ����!', '���� �Ӹ� �������� ������~', sysdate, 10, 80);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���߰�2', 1, 4, '���ȭ��ǰ!', '�������� ����ϰ�~', sysdate, 3, 59);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���ȱ�����', 1, 4, '���������!', '����� ���ϴ� ���� ��� �ֽ��ϴ�.', sysdate, 3, 56);

INSERT INTO iyaboard VALUES (boardnum.nextval, '�����䳢', 2, 4, '�����ܰ�', '��ĿǮ ���ϱ�� �ҹ��� ����', sysdate, 1, 260);
INSERT INTO iyaboard VALUES (boardnum.nextval, '�ǿ츾', 2, 4, '�̿��', '�̹���', sysdate, 5, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '�ε��ٺ�', 2, 4, 'ssss', '�̹���', sysdate, 1, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'beat145', 2, 4, '�ֽ�', '�̹���', sysdate, 30, 40);

-- �����Խ���
INSERT INTO iyaboard VALUES (boardnum.nextval, '��ĲĲ', 1, 5, '������پ�...', '���ִ°�....', sysdate, 0, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '������Թڲ�', 1, 5, '�� �ƴ»��?', '�� �ƴ� ��� ����?', sysdate, 0, 30);
INSERT INTO iyaboard VALUES (boardnum.nextval, '��ġman', 1, 5, '������õ����~', '��մ� ���� ��õ ���ּ���', sysdate, 4, 70);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���ĵκ��Ź�', 1, 5, '���̾� �ʹ� ���ƿ�~', '¯~!', sysdate, 200, 3000);
INSERT INTO iyaboard VALUES (boardnum.nextval, '��Ʈ����', 1, 5, '��� ��õ!', '0000 ��û ��վ��!', sysdate, 20, 560);

INSERT INTO iyaboard VALUES (boardnum.nextval, 'aaa', 2, 5, '���� ������ �ٵ� �� ��ó��� ?', '�Ź� �޴� ����ϱ� ����׿�~', sysdate, 30, 100);

-- �������亯
INSERT INTO iyaboard VALUES (boardnum.nextval, '��Ÿ�Ҿƹ���', 1, 6, '���� �п� ��õ����~', '���� �����п� ������ ?', sysdate, 3, 40);
INSERT INTO iyaboard VALUES (boardnum.nextval, '��ũ�ٽ�', 1, 6, '���� ����µ� ������ ��õ���ּ���~', '���� �� �������?', sysdate, 10, 20);
INSERT INTO iyaboard VALUES (boardnum.nextval, '��������', 1, 6, '���� ��õ���ּ���~', '�̵��� ���� �Ծ���ϴµ� �޴� ��õ����~', sysdate, 4, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '�Ƴ����', 1, 6, '11���� �ٴϱ� ���� �п� ����������?', '���� ���� �� �� ��õ���ּ���', sysdate, 2, 50);
INSERT INTO iyaboard VALUES (boardnum.nextval, '��dog', 1, 6, '���̵� ��� ���� �п� �ٴϳ���?', '�� ���̰� 8���ε� �������� �п��� ������ �ұ��??', sysdate, 0, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '���̰�', 1, 6, '�ܹ� �Ӹ� �� ���ִ� �̿�� ��õ���ּ���!', '�̹��� ū�� �԰� �ܹ߷� �ڸ����� �ϴµ� ���ϴ� �̿�� ��õ���ּ���~', sysdate, 0, 60);
INSERT INTO iyaboard VALUES (boardnum.nextval, '������', 1, 6, '���� �����??', '�� ���� ���� ���� �� ������?', sysdate, 10, 120);
INSERT INTO iyaboard VALUES (boardnum.nextval, 'sangdy', 1, 6, '�ｺ�� ��õ����~', '�ΰ� ���� �ｺ�� ��õ���ּ���~', sysdate, 2, 60);

INSERT INTO iyaboard VALUES (boardnum.nextval, 'aaa', 2, 6, '�Ǻΰ� ��õ����!', '�Ǻΰ� �ʹ� ���߾�� �Ф� ������ �Ǻΰ� ��õ�� ���ּ���!', sysdate, 3, 68);

SELECT * FROM iyaboard;


-- ��� ���̺�
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


-- ��õ ����õ ���̺�
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