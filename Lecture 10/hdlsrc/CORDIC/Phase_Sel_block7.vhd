-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\CORDIC\Phase_Sel_block7.vhd
-- Created: 2018-11-13 04:29:09
-- 
-- Generated by MATLAB 9.1 and HDL Coder 3.9
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Phase_Sel_block7
-- Source Path: CORDIC/CORDIC_cos_sin/Stage_6/Phase_Sel
-- Hierarchy Level: 2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Phase_Sel_block7 IS
  PORT( sel                               :   IN    std_logic;
        out_rsvd                          :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END Phase_Sel_block7;


ARCHITECTURE rtl OF Phase_Sel_block7 IS

  -- Signals
  SIGNAL Constant_out1                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Unary_Minus_cast                 : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Unary_Minus_cast_1               : signed(16 DOWNTO 0);  -- sfix17_En15
  SIGNAL Unary_Minus_out1                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Multiport_Switch_out1            : signed(15 DOWNTO 0);  -- sfix16_En15

BEGIN
  -- <S70>/Constant
  Constant_out1 <= to_signed(16#0200#, 16);

  -- <S70>/Unary Minus
  Unary_Minus_cast <= resize(Constant_out1, 17);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(15 DOWNTO 0);

  -- <S70>/Multiport Switch
  
  Multiport_Switch_out1 <= Unary_Minus_out1 WHEN sel = '0' ELSE
      Constant_out1;

  out_rsvd <= std_logic_vector(Multiport_Switch_out1);

END rtl;

