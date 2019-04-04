library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity mips_file is
    port (
        A1,A2,A3: in  std_logic_vector(4  downto 0);
        WD3:      in  std_logic_vector(31 downto 0);
        WE3,CLK:  in  bit;
        RD1,RD2:  out std_logic_vector(31 downto 0)
    );
end entity mips_file;

architecture behav of mips_file is
type reglist is
array(0 to 31) of std_logic_vector(31 downto 0);
signal reg:reglist;
begin

    p1:process(CLK,WE3,A1,A2,A3)
    begin

        if (CLK='1') then
            if (WE3='1') then
                reg(to_integer(unsigned(A3)))<=WD3;
            end if;

            RD1<=reg(to_integer(unsigned(A1)));
            RD2<=reg(to_integer(unsigned(A2)));

        end if;

    end process p1;

end architecture behav;