-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\CORDIC\Shift_Sel1.vhd
-- Created: 2018-11-13 04:29:09
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Shift_Sel1
-- Source Path: CORDIC/CORDIC_cos_sin/Stage_0/Shift_Sel1
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Shift_Sel1 IS
  PORT( in_rsvd                           :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En14
        sel                               :   IN    std_logic;
        out_rsvd                          :   OUT   std_logic_vector(16 DOWNTO 0)  -- sfix17_En14
        );
END Shift_Sel1;


ARCHITECTURE rtl OF Shift_Sel1 IS

  -- Signals
  SIGNAL in_signed                        : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus_cast                 : signed(17 DOWNTO 0);  -- sfix18_En14
  SIGNAL Unary_Minus_cast_1               : signed(17 DOWNTO 0);  -- sfix18_En14
  SIGNAL Unary_Minus_out1                 : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Multiport_Switch_out1            : signed(16 DOWNTO 0);  -- sfix17_En14

BEGIN
  -- <S16>/Bit Shift
  in_signed <= signed(in_rsvd);

  -- <S16>/Unary Minus
  Unary_Minus_cast <= resize(in_signed, 18);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(16 DOWNTO 0);

  -- <S16>/Multiport Switch
  
  Multiport_Switch_out1 <= Unary_Minus_out1 WHEN sel = '0' ELSE
      in_signed;

  out_rsvd <= std_logic_vector(Multiport_Switch_out1);

END rtl;

