-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\overflow_and_saturation\overflow_detection.vhd
-- Created: 2018-11-05 12:31:08
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: overflow_detection
-- Source Path: overflow_and_saturation/Overflow Detection and Saturation 4 bit adder/overflow detection
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY overflow_detection IS
  PORT( x                                 :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
        y                                 :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
        d                                 :   OUT   std_logic  -- ufix1
        );
END overflow_detection;


ARCHITECTURE rtl OF overflow_detection IS

  -- Signals
  SIGNAL x_signed                         : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL y_signed                         : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL x0                               : std_logic;  -- ufix1
  SIGNAL x1                               : std_logic;  -- ufix1
  SIGNAL x2                               : std_logic;  -- ufix1
  SIGNAL x3                               : std_logic;  -- ufix1
  SIGNAL y0                               : std_logic;  -- ufix1
  SIGNAL y1                               : std_logic;  -- ufix1
  SIGNAL y2                               : std_logic;  -- ufix1
  SIGNAL y3                               : std_logic;  -- ufix1
  SIGNAL c1                               : std_logic;  -- ufix1
  SIGNAL t1                               : std_logic;  -- ufix1
  SIGNAL t2                               : std_logic;  -- ufix1
  SIGNAL c2                               : std_logic;  -- ufix1
  SIGNAL c3                               : std_logic;  -- ufix1
  SIGNAL c4                               : std_logic;  -- ufix1
  SIGNAL t1_1                             : std_logic;  -- ufix1
  SIGNAL t2_1                             : std_logic;  -- ufix1
  SIGNAL t1_2                             : std_logic;  -- ufix1
  SIGNAL t2_2                             : std_logic;  -- ufix1

BEGIN
  x_signed <= signed(x);

  y_signed <= signed(y);

  --MATLAB Function 'Overflow Detection and Saturation 4 bit adder/overflow detection': '<S2>:1'
  --'<S2>:1:3'
  x0 <= x_signed(0);
  --'<S2>:1:4'
  x1 <= x_signed(1);
  --'<S2>:1:5'
  x2 <= x_signed(2);
  --'<S2>:1:6'
  x3 <= x_signed(3);
  --'<S2>:1:8'
  y0 <= y_signed(0);
  --'<S2>:1:9'
  y1 <= y_signed(1);
  --'<S2>:1:10'
  y2 <= y_signed(2);
  --'<S2>:1:11'
  y3 <= y_signed(3);
  --'<S2>:1:13'
  c1 <= x0 AND y0;
  --'<S2>:1:15'
  t1 <= x1 AND y1;
  --'<S2>:1:16'
  t2 <= (x1 OR y1) AND c1;
  --'<S2>:1:17'
  c2 <= t1 OR t2;
  --'<S2>:1:19'
  t1_1 <= x2 AND y2;
  --'<S2>:1:20'
  t2_1 <= (x2 OR y2) AND c2;
  --'<S2>:1:21'
  c3 <= t1_1 OR t2_1;
  --'<S2>:1:23'
  t1_2 <= x3 AND y3;
  --'<S2>:1:24'
  t2_2 <= (x3 OR y3) AND c3;
  --'<S2>:1:25'
  c4 <= t1_2 OR t2_2;
  --'<S2>:1:27'
  d <= c4 XOR c3;

END rtl;
