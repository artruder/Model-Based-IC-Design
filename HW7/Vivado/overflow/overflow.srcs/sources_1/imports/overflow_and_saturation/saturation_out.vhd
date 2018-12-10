-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\overflow_and_saturation\saturation_out.vhd
-- Created: 2018-11-05 12:31:08
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: saturation_out
-- Source Path: overflow_and_saturation/Overflow Detection and Saturation 4 bit adder/saturation out
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY saturation_out IS
  PORT( x                                 :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
        y                                 :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4
        d                                 :   IN    std_logic;  -- ufix1
        z                                 :   OUT   std_logic_vector(3 DOWNTO 0)  -- sfix4
        );
END saturation_out;


ARCHITECTURE rtl OF saturation_out IS

  -- Signals
  SIGNAL x_signed                         : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL y_signed                         : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL z_tmp                            : signed(3 DOWNTO 0);  -- sfix4

BEGIN
  x_signed <= signed(x);

  y_signed <= signed(y);

  saturation_out_1_output : PROCESS (x_signed, y_signed, d)
    VARIABLE s1 : std_logic;
    VARIABLE s2 : std_logic;
  BEGIN
    --MATLAB Function 'Overflow Detection and Saturation 4 bit adder/saturation out': '<S3>:1'
    --'<S3>:1:3'
    s1 := x_signed(3);
    --'<S3>:1:4'
    s2 := y_signed(3);
    IF d = '1' THEN 
      --'<S3>:1:6'
      IF (s1 AND s2) /= '0' THEN 
        --'<S3>:1:8'
        z_tmp <= to_signed(-16#08#, 4);
      ELSE 
        --'<S3>:1:10'
        z_tmp <= to_signed(16#7#, 4);
      END IF;
    ELSE 
      --'<S3>:1:13'
      z_tmp <= x_signed;
      -- this path is irrelevant
    END IF;
  END PROCESS saturation_out_1_output;


  z <= std_logic_vector(z_tmp);

END rtl;
