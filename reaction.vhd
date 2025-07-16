-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"
-- CREATED		"Fri Mar  7 22:33:32 2025"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY reaction IS 
	PORT
	(
		CLOCK :  IN  STD_LOGIC;
		RES :  IN  STD_LOGIC;
		STR :  IN  STD_LOGIC;
		REC :  IN  STD_LOGIC;
		pin_name1 :  OUT  STD_LOGIC;
		pin_name2 :  OUT  STD_LOGIC;
		pin_name3 :  OUT  STD_LOGIC;
		pin_name4 :  OUT  STD_LOGIC;
		pin_name5 :  OUT  STD_LOGIC;
		pin_name6 :  OUT  STD_LOGIC;
		pin_name7 :  OUT  STD_LOGIC;
		pin_name8 :  OUT  STD_LOGIC;
		pin_name9 :  OUT  STD_LOGIC;
		dis1 :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		led :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END reaction;

ARCHITECTURE bdf_type OF reaction IS 

COMPONENT timer
	PORT(clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 start : IN STD_LOGIC;
		 react : IN STD_LOGIC;
		 mstime : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 sendVal : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT displayhex
GENERIC (DATA_WIDTH : INTEGER
			);
	PORT(a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	dis2 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	dis_ALTERA_SYNTHESIZED1 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	led_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	ms :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : timer
PORT MAP(clk => CLOCK,
		 reset => RES,
		 start => STR,
		 react => REC,
		 mstime => ms,
		 sendVal => led_ALTERA_SYNTHESIZED);


b2v_inst1 : displayhex
GENERIC MAP(DATA_WIDTH => 8
			)
PORT MAP(a => ms(7 DOWNTO 4),
		 result => dis_ALTERA_SYNTHESIZED1);


b2v_inst2 : displayhex
GENERIC MAP(DATA_WIDTH => 8
			)
PORT MAP(a => ms(3 DOWNTO 0),
		 result => dis2);

pin_name1 <= dis_ALTERA_SYNTHESIZED1(5);
pin_name2 <= dis_ALTERA_SYNTHESIZED1(6);
pin_name3 <= dis2(0);
pin_name4 <= dis2(1);
pin_name5 <= dis2(2);
pin_name6 <= dis2(3);
pin_name7 <= dis2(4);
pin_name8 <= dis2(5);
pin_name9 <= dis2(6);
dis1 <= dis_ALTERA_SYNTHESIZED1;
led <= led_ALTERA_SYNTHESIZED;

END bdf_type;