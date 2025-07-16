-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is

	port(
		clk		 : in	std_logic;
		reset	 : in	std_logic;
		start : in std_logic;
		react : in std_logic;
		mstime : out	unsigned(7 downto 0);
		sendVal : out std_logic_vector (2 downto 0) 	
		
	);

end timer;

architecture rtl of timer is

	-- Build an enumerated type for the state machine
	type state_type is (sIdle, sWait, sCount);

	-- Register to hold the current state
	signal state   : state_type;
	signal count : unsigned (27 downto 0);

begin


	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '0' then
			state <= sIdle;
			count <= (others => '0');
			
		elsif (rising_edge(clk)) then
            
            case state is
                when sIdle =>                    
                    if start = '0' then  
                        state <= sWait;
								count <= (others => '0');
                    end if;
                    
                when sWait =>
					 count <= count +1;
                    if count(27) = '1' then 
                        state <= sCount;
								count <= (others => '0');
                    end if;
                    
                   
                    if react = '0' then
                        count <= (others => '1');  
                        state <= sIdle;
                    end if;
                    
                when sCount =>
					 count <= count +1;
                    if react = '0' then
								
                        state <= sIdle;
                    end if;
                    
            end case;
        end if;
    end process;
sendVal <= "001" when state = sIdle
else "010" when state = sWait
else "100" when state = sCount;
  
    mstime <= (others => '0') when state = sWait
	 else count(27 downto 20);
				  
  end rtl;
  