CREATE TABLE �� (
    �����̵� VARCHAR(20) NOT NULL,
    ���̸� VARCHAR(10) NOT NULL,
    ���� INT,
    ��� VARCHAR(10) NOT NULL,
    ���� VARCHAR(10) NOT NULL,
    ������ INT DEFAULT 0,
    PRIMARY KEY(�����̵�)
);

CREATE TABLE ��ǰ (
    ��ǰ��ȣ CHAR(3) NOT NULL,
    ��ǰ�� VARCHAR(20),
    ��� INT,
    �ܰ� INT,
    ������ü VARCHAR(20),
    PRIMARY KEY(��ǰ��ȣ),
    CHECK (��� >= 0 AND ��� <= 10000)
);

CREATE TABLE �ֹ� (
    �ֹ���ȣ CHAR(3) NOT NULL,
    �ֹ��� VARCHAR(20),
    �ֹ���ǰ CHAR(3),
    ���� INT,
    ����� VARCHAR(30),
    �ֹ����� DATE,
    PRIMARY KEY(�ֹ���ȣ),
    FOREIGN KEY(�ֹ���) REFERENCES ��(�����̵�),
    FOREIGN KEY(�ֹ���ǰ) REFERENCES ��ǰ(��ǰ��ȣ)
);