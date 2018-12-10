-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\CORDIC\Shift_Sel1_block5.vhd
-- Created: 2018-11-13 04:29:09
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Shift_Sel1_block5
-- Source Path: CORDIC/CORDIC_cos_sin/Stage_4/Shift_Sel1
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Shift_Sel1_block5 IS
  PORT( in_rsvd                           :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En14
        sel                               :   IN    std_logic;
        out_rsvd                          :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En14
        );
END Shift_Sel1_block5;


ARCHITECTURE rtl OF Shift_Sel1_block5 IS

  -- Signals
  SIGNAL in_signed                        : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Bit_Shift_out1                   : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Unary_Minus_cast                 : signed(32 DOWNTO 0);  -- sfix33_En14
  SIGNAL Unary_Minus_cast_1               : signed(32 DOWNTO 0);  -- sfix33_En14
  SIGNAL Unary_Minus_out1                 : signed(31 DOWNTO 0);  -- sfix32_En14
  SIGNAL Multiport_Switch_out1            : signed(31 DOWNTO 0);  -- sfix32_En14

BEGIN
  in_signed <= signed(in_rsvd);

  -- <S58>/Bit Shift
  Bit_Shift_out1 <= SHIFT_RIGHT(in_signed, 4);

  -- <S58>/Unary Minus
  Unary_Minus_cast <= resize(Bit_Shift_out1, 33);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(31 DOWNTO 0);

  -- <S58>/Multiport Switch
  
  Multiport_Switch_out1 <= Unary_Minus_out1 WHEN sel = '0' ELSE
      Bit_Shift_out1;

  out_rsvd <= std_logic_vector(Multiport_Switch_out1);

END rtl;

