-- 3.57 Mhz clock from a 50 Mhz input
-- Ronivon C. costa
-- 03/2008
------------------------------------------------------------------
library IEEE;
use  IEEE.STD_LOGIC_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY Clock_357Mhz IS
	PORT (
		clock_50Mhz				: IN	STD_LOGIC;
		clock_60hz				: OUT   STD_LOGIC;
		clock_357Mhz			: OUT	STD_LOGIC);
	END Clock_357Mhz;

ARCHITECTURE rtl OF Clock_357Mhz IS

	SIGNAL counter: STD_LOGIC_VECTOR(3 DOWNTO 0); 
	SIGNAL clock_357Mhz_int : STD_LOGIC;
	SIGNAL counter_60: STD_LOGIC_VECTOR(19 DOWNTO 0); 
	SIGNAL clock_60hz_int   : STD_LOGIC;
	

BEGIN

	PROCESS (clock_50Mhz)
	BEGIN
		IF clock_50Mhz'EVENT and clock_50Mhz = '1' THEN
			IF counter < "1110" THEN
				counter <= counter + 1;
			ELSE
				counter <= "0000";
				clock_357Mhz_int <= not clock_357Mhz_int;
			END IF;
		END IF;
		
		IF clock_50Mhz'EVENT and clock_50Mhz = '1' THEN
			IF counter_60 < x"CB735" THEN
				counter_60 <= counter_60 + 1;
			ELSE
				counter_60 <= x"00000";
				clock_60hz_int <= not clock_60hz_int;
			END IF;
		END IF;		
		
	clock_60hz <= clock_60hz_int;
	clock_357Mhz <= clock_357Mhz_int;

	END PROCESS;
END rtl;
