create or replace package fdc_lib is
-- ������������� (����������� �� ����� ������) ���������� ������� � �������� 
-- ��� ������ �� ��������, ������� � ������,
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- RomanToNumber
-- ��������� ������ �� ������� ���� � �����
-- ���� �� �������, �� ���������� 0
function RomanToNumber
  (
  pRoman varchar2
  ) 
return number;

-------------------------------------------------------------------------------------------
-- Random_Num
-- ��������� ����� � ��������� low <= x < high
function Random_Num 
  (
  low IN NUMBER,     -- ������� ������� ���������
  high IN NUMBER     -- ������ ������� ���������
  ) 
RETURN NUMBER; 

-------------------------------------------------------------------------------------------
-- DateDiff
-- ����������� ������� (� ��������) ����� pDate1 � pDate2
function DateDiff
  (
  pDate1 date, 
  pDate2 date
  ) 
return number;

-------------------------------------------------------------------------------------------
-- DateDiff_HMS
-- ����������� ������� ����� pDate1 � pDate2
-- � ���������� �� � ������� HH:MI:SS
function DateDiff_HMS
  (
  pDate1 date, 
  pDate2 date
  ) 
return varchar2;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      CRC32 - ������ ����������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- CRC_32
-- ������� ������� ����������� ����� ������
-- wrapper ��� ���������� �������� � 1-� ���������� - �������
FUNCTION CRC_32
  (
  pSTR IN VARCHAR2   -- ������, �� ������� ������ ���� ��������� ����������� �����
  )
RETURN VARCHAR2;


-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ������ �������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- IPAddrStrToBinaryInteger
-- ������������ ������ IP-������ ��� ����� �����
function IPAddrStrToBinaryInteger(IPAddrStr in varchar2) 
  return number;


end fdc_lib;
/
create or replace package body fdc_Lib is

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- RomanToNumber
-- ��������� ������ �� ������� ���� � �����
-- ���� �� �������, �� ���������� 0
function RomanToNumber
  (
  pRoman varchar2
  ) 
return number
is
  -- ������� �������������
  type TRcLetter is VARRAY(18) OF char(1);
  type TRcNumber is VARRAY(18) OF number(10,0);
  LConv TRcLetter := TRcLetter('I',
                               'V',
                               'X',
                               '�', -- �������
                               'L',
                               'C',
                               '�', -- �������
                               'D',
                               'M',
                               '�', -- �������
                               'S',
                               'R',
                               'Q',
                               'P',
                               '�', -- �������
                               'O',
                               '�', -- �������
                               'N');

  NConv TRcNumber := TRcNumber(1,
                               5,
                               10,
                               10,
                               50,
                               100,
                               100,
                               500,
                               1000,
                               1000,
                               5000,
                               10000,
                               50000,
                               100000,
                               100000,
                               500000,
                               500000,
                               1000000);
  lStr varchar2(2000);
  Result number(13,0) := 0;
  nState number(13,0) := 0;
  nLen number(13,0);
  nSidx number(13,0) := 0;
  bFound boolean;
begin
  lStr := upper(trim(pRoman));
  --�������� ������� � �������������� ������� ���� �� ������ ��������������
  lStr := replace(lStr, '_V', 'S');
  lStr := replace(lStr, '_X', 'R');
  lStr := replace(lStr, '_�', 'R'); --�������
  lStr := replace(lStr, '_L', 'Q');
  lStr := replace(lStr, '_C', 'P');
  lStr := replace(lStr, '_�', 'P'); --�������
  lStr := replace(lStr, '_D', 'O');
  lStr := replace(lStr, '_M', 'N');
  lStr := replace(lStr, '_�', 'N'); --�������
  nLen := length(lStr);
  for l in reverse 1..nLen loop
      bFound := FALSE;
      for i in 1..18 loop
        if (Substr(lStr,l,1) = LConv(i)) then
           bFound := TRUE;
           if (nState > NConv(i)) then
              Result := Result - NConv(i);
            else
              Result := Result + NConv(i);
              nState := NConv(i);
           end if;
           Exit;
        end if;
      end loop;
      if (not bFound) then
         return(0);
      end if;
  end loop;
  return(Result);
end RomanToNumber;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Random_Num
-- ��������� ����� � ��������� low <= x < high
function Random_Num 
  (
  low IN NUMBER,     -- ������� ������� ���������
  high IN NUMBER     -- ������ ������� ���������
  ) 
RETURN NUMBER 
is
begin
  return dbms_Random.Value(low, high);
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- DateDiff
-- ����������� ������� (� ��������) ����� pDate1 � pDate2
function DateDiff
  (
  pDate1 date, 
  pDate2 date
  ) 
return number 
is
begin
 	return (pDate2 - pDate1) * 86400;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- DateDiff_HMS
-- ����������� ������� ����� pDate1 � pDate2
-- � ���������� �� � ������� HH:MI:SS
function DateDiff_HMS
  (
  pDate1 date, 
  pDate2 date
  ) 
return varchar2
is
  pHH number;
  pMI number;
  pSec number;
  pStr varchar2(1500);
begin
  pSec :=  DateDiff(pDate1, pDate2);
  pHH := nvl(trunc(pSec / 3600),0);
  pMI := nvl(trunc((pSec - pHH * 3600) / 60),0);
  pSec := nvl(trunc(pSec - pHH * 3600 - pMI * 60),0);
  pStr := pHH||':'||lpad(pMI,2,'0')||':'||lpad(pSec,2,'0');
  return pStr;
end;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      CRC32 - ������ ����������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- CRC_SHIFT_RIGHT8
FUNCTION CRC_SHIFT_RIGHT8(Arg IN BINARY_INTEGER)
RETURN BINARY_INTEGER
IS
Result BINARY_INTEGER;
BEGIN
  Result := UTL_RAW.CAST_TO_BINARY_INTEGER(
    SUBSTRB(UTL_RAW.CAST_FROM_BINARY_INTEGER(Arg), 1, 6));
  RETURN(Result);
END CRC_SHIFT_RIGHT8;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- CRC_CALCCRC32
-- ���������� ������� CRC ��� ������ �����
FUNCTION CRC_CALCCRC32(CRC IN BINARY_INTEGER
		 		 , BUF IN VARCHAR2
				 , CurPos IN BINARY_INTEGER)
RETURN BINARY_INTEGER
IS
Result BINARY_INTEGER;
  CurChar BINARY_INTEGER;
  Ind BINARY_INTEGER;
--������ Crc32-�������������� - 256 ���������� �������
  TYPE int_list IS TABLE OF BINARY_INTEGER;
  crc_table int_list := int_list (
     0,           1996959894, -301047508,  -1727442502,  124634137,
     1886057615, -379345611,  -1637575261,  249268274,   2044508324,
    -522852066,  -1747789432,  162941995,   2125561021, -407360249,
    -1866523247,  498536548,   1789927666, -205950648,  -2067906082,
     450548861,   1843258603, -187386543,  -2083289657,  325883990,
     1684777152, -43845254,   -1973040660,  335633487,   1661365465,
    -99664541,   -1928851979,  997073096,   1281953886, -715111964,
    -1570279054,  1006888145,  1258607687, -770865667,  -1526024853,
     901097722,   1119000684, -608450090,  -1396901568,  853044451,
     1172266101, -589951537,  -1412350631,  651767980,   1373503546,
    -925412992,  -1076862698,  565507253,   1454621731, -809855591,
    -1195530993,  671266974,   1594198024, -972236366,  -1324619484,
     795835527,   1483230225, -1050600021, -1234817731,  1994146192,
     31158534,   -1731059524, -271249366,   1907459465,  112637215,
    -1614814043, -390540237,   2013776290,  251722036,  -1777751922,
    -519137256,   2137656763,  141376813,  -1855689577, -429695999,
     1802195444,  476864866,  -2056965928, -228458418,   1812370925,
     453092731,  -2113342271, -183516073,   1706088902,  314042704,
    -1950435094, -54949764,    1658658271,  366619977,  -1932296973,
    -69972891,    1303535960,  984961486,  -1547960204, -725929758,
     1256170817,  1037604311, -1529756563, -740887301,   1131014506,
     879679996,  -1385723834, -631195440,   1141124467,  855842277,
    -1442165665, -586318647,   1342533948,  654459306,  -1106571248,
    -921952122,   1466479909,  544179635,  -1184443383, -832445281,
     1591671054,  702138776,  -1328506846, -942167884,   1504918807,
     783551873,  -1212326853, -1061524307, -306674912,  -1698712650,
     62317068,    1957810842, -355121351,  -1647151185,  81470997,
     1943803523, -480048366,  -1805370492,  225274430,   2053790376,
    -468791541,  -1828061283,  167816743,   2097651377, -267414716,
    -2029476910,  503444072,   1762050814, -144550051,  -2140837941,
     426522225,   1852507879, -19653770,   -1982649376,  282753626,
     1742555852, -105259153,  -1900089351,  397917763,   1622183637,
    -690576408,  -1580100738,  953729732,   1340076626, -776247311,
    -1497606297,  1068828381,  1219638859, -670225446,  -1358292148,
     906185462,   1090812512, -547295293,  -1469587627,  829329135,
     1181335161, -882789492,  -1134132454,  628085408,   1382605366,
    -871598187,  -1156888829,  570562233,   1426400815, -977650754,
    -1296233688,  733239954,   1555261956, -1026031705, -1244606671,
     752459403,   1541320221, -1687895376, -328994266,   1969922972,
     40735498,   -1677130071, -351390145,   1913087877,  83908371,
    -1782625662, -491226604,   2075208622,  213261112,  -1831694693,
    -438977011,   2094854071,  198958881,  -2032938284, -237706686,
     1759359992,  534414190,  -2118248755, -155638181,   1873836001,
     414664567,  -2012718362, -15766928,    1711684554,  285281116,
    -1889165569, -127750551,   1634467795,  376229701,  -1609899400,
    -686959890,   1308918612,  956543938,  -1486412191, -799009033,
     1231636301,  1047427035, -1362007478, -640263460,   1088359270,
     936918000,  -1447252397, -558129467,   1202900863,  817233897,
    -1111625188, -893730166,   1404277552,  615818150,  -1160759803,
    -841546093,   1423857449,  601450431,  -1285129682, -1000256840,
     1567103746,  711928724,  -1274298825, -1022587231,  1510334235,
     755167117
  );
BEGIN
--PL/SQL'��� ���������� ���������� ����������
--Crc32 ��� ������ �����
  CurChar := ASCII(SUBSTRB(BUF, CurPos, 1));
  Ind := UTL_RAW.CAST_TO_BINARY_INTEGER(
    UTL_RAW.BIT_XOR(UTL_RAW.CAST_FROM_BINARY_INTEGER(Crc),
    UTL_RAW.CAST_FROM_BINARY_INTEGER(CurChar)));
  Ind := BITAND(Ind, 255);

  Result := UTL_RAW.CAST_TO_BINARY_INTEGER(
    UTL_RAW.BIT_XOR(UTL_RAW.CAST_FROM_BINARY_INTEGER(crc_table(Ind + 1)),
    UTL_RAW.CAST_FROM_BINARY_INTEGER(CRC_SHIFT_RIGHT8(Crc))));

  RETURN(Result);
END CRC_CALCCRC32;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- CRC_32
-- ������� ������� ����������� ����� ������
-- ��������� � �������� ��������������� ���������
-- ���������� ����������� �����
FUNCTION CRC_32
  (
  pSTR IN VARCHAR2,             -- ������, �� ������� ������ ���� ��������� ����������� �����
  prev_CRC IN BINARY_INTEGER    -- 0 ��� CRC ��� ���������� ����� ������� ���������� ������
  ) 
RETURN VARCHAR2
IS
  Result BINARY_INTEGER;
  Len BINARY_INTEGER;
  CurPos BINARY_INTEGER;
BEGIN
--PL/SQL'��� ���������� Crc32-���������,
--C'���� ���������� �������� ����� ��
--���������� Zlib ������ 1.1.4 (www.zlib.org).
--������������ ������� CALCCRC32 � SHIFT_RIGHT8.
--������������ ����� UTL_RAW. ����� ��������������
--��� ��� �������������.
  IF pSTR IS NULL
  THEN
    RETURN 0;
  END IF;

  Result := UTL_RAW.CAST_TO_BINARY_INTEGER(
    UTL_RAW.BIT_XOR(UTL_RAW.CAST_FROM_BINARY_INTEGER(prev_CRC),
    UTL_RAW.CAST_FROM_BINARY_INTEGER(-1)));

  Len := LENGTH (pSTR);
  CurPos := 1;
  WHILE Len >= 8 LOOP
    FOR i IN 1..8 LOOP
      Result := CRC_CalcCrc32(Result, pSTR, CurPos);
      CurPos := CurPos + 1;
    END LOOP;
    Len := Len - 8;
  END LOOP;

  IF Len <> 0
  THEN
    WHILE Len <> 0 LOOP
      Result := CRC_CalcCrc32(Result, pSTR, CurPos);
      CurPos := CurPos + 1;
      Len := Len - 1;
    END LOOP;
  END IF;
  Result := UTL_RAW.CAST_TO_BINARY_INTEGER(
    UTL_RAW.BIT_XOR(UTL_RAW.CAST_FROM_BINARY_INTEGER(Result),
    UTL_RAW.CAST_FROM_BINARY_INTEGER(-1)));
 RETURN UTL_RAW.CAST_FROM_BINARY_INTEGER(Result);
END CRC_32;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- CRC_32
-- ������� ������� ����������� ����� ������
-- wrapper ��� ���������� �������� � 1-� ���������� - �������
FUNCTION CRC_32
  (
  pSTR IN VARCHAR2   -- ������, �� ������� ������ ���� ��������� ����������� �����
  )
RETURN VARCHAR2
IS
BEGIN
 RETURN CRC_32(pSTR, 0);
END;

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--      ������ �������� �����
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- IPAddrStrToBinaryInteger
-- ������������ ������ IP-������ ��� ����� �����
function IPAddrStrToBinaryInteger(IPAddrStr in varchar2) 
  return number
is
  vPortion varchar2(10);
  vPortionInt number;
  vPrevPos number;
  vNextDotPos number;
  vResult number;
begin
  vResult := 0;
  vPrevPos := 1;
  for i in 1..4 loop
    vNextDotPos := InStr(IPAddrStr, '.', vPrevPos);
    if vNextDotPos = 0 then
      vNextDotPos := Length(IPAddrStr) + 1;
    end if;
    vPortion := SubStr(IPAddrStr, vPrevPos, vNextDotPos - vPrevPos);
    vPrevPos := vNextDotPos + 1; 
    
    vPortionInt := vPortion;
    case i 
      when 1 then vResult := vResult + vPortionInt;
      when 2 then vResult := vResult + vPortionInt * 256;
      when 3 then vResult := vResult + vPortionInt * 65536;
      when 4 then vResult := vResult + vPortionInt * 16777216;
    end case;
  end loop;
  return vResult;
end;

end fdc_lib;
/
