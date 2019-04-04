-- 4-bit Register File Hardware Description
-- Caleb Shepard
-- cshepard6055
library ieee;
use ieee.std_logic_1164.all;

entity register_file is
    port(
        clk, load, reset:   in  bit;
        i:                  in  std_logic_vector(3 downto 0);
        q:                  out std_logic_vector(3 downto 0)
    );
end entity register_file;

architecture behav of register_file is
    begin p1:process(clk,load,reset)
        begin if (reset='1')
            then q<="0000";
        end if;
        if (clk='1') and (load='1') and (reset='0')
            then q<=i;
        end if;
    end process p1;
end architecture behav;