library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity ROM_N6 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(9 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of ROM_N6 is
	type rom is array(0 to  1023) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"0",X"0",X"6",X"6",X"6",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"0",X"8",X"B",X"B",X"B",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"C",X"0",X"0",X"6",X"F",X"B",X"8",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"0",X"0",X"2",X"F",X"B",X"C",X"6",X"C",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"0",X"2",X"7",X"B",X"C",X"6",X"C",X"8",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"2",X"7",X"B",X"E",X"7",X"3",X"6",X"C",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"7",X"7",X"8",X"F",X"1",X"3",X"A",X"E",X"0",X"8",X"8",
		X"0",X"0",X"0",X"0",X"0",X"E",X"E",X"0",X"F",X"9",X"9",X"B",X"E",X"0",X"E",X"E",
		X"0",X"0",X"0",X"0",X"E",X"E",X"0",X"F",X"9",X"9",X"9",X"F",X"0",X"E",X"E",X"0",
		X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"E",X"B",X"9",X"9",X"F",X"0",X"E",X"E",X"0",
		X"0",X"0",X"0",X"0",X"8",X"8",X"0",X"E",X"A",X"3",X"1",X"F",X"8",X"7",X"7",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"6",X"3",X"7",X"E",X"B",X"7",X"2",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"6",X"C",X"B",X"7",X"2",X"0",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"6",X"C",X"B",X"F",X"2",X"0",X"0",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"8",X"B",X"F",X"6",X"0",X"0",X"C",X"C",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"B",X"B",X"B",X"8",X"0",X"6",X"6",X"6",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"0",X"0",X"6",X"6",X"6",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"8",X"8",X"B",X"B",X"B",X"8",X"8",X"0",
		X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"8",X"8",X"A",X"B",X"F",X"C",X"C",X"C",X"8",
		X"0",X"0",X"0",X"0",X"8",X"C",X"8",X"0",X"2",X"B",X"F",X"4",X"6",X"6",X"E",X"C",
		X"0",X"0",X"0",X"0",X"0",X"8",X"0",X"2",X"7",X"B",X"C",X"6",X"2",X"3",X"F",X"6",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"2",X"7",X"B",X"C",X"6",X"3",X"F",X"E",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"C",X"E",X"0",X"C",X"6",X"3",X"F",X"E",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"E",X"7",X"3",X"F",X"E",X"0",X"8",X"8",
		X"0",X"0",X"0",X"0",X"8",X"8",X"0",X"E",X"3",X"1",X"3",X"E",X"0",X"8",X"8",X"0",
		X"0",X"0",X"0",X"0",X"8",X"8",X"0",X"E",X"F",X"3",X"7",X"E",X"0",X"C",X"C",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"E",X"F",X"3",X"6",X"C",X"0",X"E",X"C",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"E",X"F",X"3",X"6",X"C",X"B",X"7",X"2",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"6",X"F",X"3",X"2",X"6",X"C",X"B",X"7",X"2",X"0",X"8",X"0",
		X"0",X"0",X"0",X"0",X"C",X"E",X"6",X"6",X"4",X"F",X"B",X"2",X"0",X"8",X"C",X"8",
		X"0",X"0",X"0",X"0",X"8",X"C",X"C",X"C",X"F",X"B",X"A",X"8",X"8",X"6",X"6",X"6",
		X"0",X"0",X"0",X"0",X"0",X"8",X"8",X"B",X"B",X"B",X"8",X"8",X"6",X"6",X"6",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"0",X"0",X"6",X"6",X"6",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"0",X"8",X"B",X"B",X"B",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"C",X"0",X"0",X"6",X"F",X"B",X"8",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"0",X"0",X"2",X"F",X"B",X"C",X"E",X"C",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"0",X"2",X"7",X"B",X"C",X"E",X"C",X"8",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"2",X"7",X"B",X"E",X"F",X"F",X"E",X"C",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"7",X"7",X"8",X"F",X"F",X"F",X"E",X"E",X"0",X"8",X"8",
		X"0",X"0",X"0",X"0",X"0",X"E",X"E",X"0",X"F",X"F",X"F",X"F",X"E",X"0",X"C",X"C",
		X"0",X"0",X"0",X"0",X"E",X"E",X"0",X"F",X"F",X"F",X"F",X"F",X"0",X"E",X"E",X"0",
		X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"E",X"F",X"F",X"F",X"F",X"0",X"E",X"E",X"0",
		X"0",X"0",X"0",X"0",X"8",X"8",X"0",X"E",X"E",X"F",X"F",X"F",X"8",X"7",X"7",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"E",X"F",X"F",X"E",X"B",X"7",X"2",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"E",X"C",X"B",X"7",X"2",X"0",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"C",X"E",X"C",X"B",X"F",X"2",X"0",X"0",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"8",X"B",X"F",X"6",X"0",X"0",X"C",X"C",X"8",X"0",
		X"0",X"0",X"0",X"0",X"0",X"8",X"B",X"B",X"B",X"8",X"0",X"6",X"6",X"6",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"0",X"0",X"6",X"6",X"6",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"8",X"8",X"B",X"B",X"B",X"8",X"8",X"0",
		X"0",X"0",X"0",X"0",X"6",X"6",X"6",X"8",X"8",X"A",X"B",X"F",X"C",X"C",X"C",X"8",
		X"0",X"0",X"0",X"0",X"8",X"C",X"8",X"0",X"2",X"B",X"F",X"C",X"E",X"E",X"E",X"C",
		X"0",X"0",X"0",X"0",X"0",X"8",X"0",X"2",X"7",X"B",X"C",X"E",X"E",X"F",X"F",X"6",
		X"0",X"0",X"0",X"0",X"0",X"0",X"0",X"2",X"7",X"B",X"C",X"E",X"F",X"F",X"E",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"C",X"E",X"0",X"C",X"E",X"F",X"F",X"E",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"C",X"C",X"0",X"E",X"F",X"F",X"F",X"E",X"0",X"8",X"8",
		X"0",X"0",X"0",X"0",X"8",X"8",X"0",X"E",X"F",X"F",X"F",X"E",X"0",X"8",X"8",X"0",
		X"0",X"0",X"0",X"0",X"8",X"8",X"0",X"E",X"F",X"F",X"F",X"E",X"0",X"C",X"C",X"0",
		X"0",X"0",X"0",X"0",X"0",X"0",X"E",X"F",X"F",X"E",X"C",X"0",X"E",X"C",X"0",X"0",
		X"0",X"0",X"0",X"0",X"0",X"E",X"F",X"F",X"E",X"C",X"B",X"7",X"2",X"0",X"0",X"0",
		X"0",X"0",X"0",X"0",X"6",X"F",X"F",X"E",X"E",X"C",X"B",X"7",X"2",X"0",X"8",X"0",
		X"0",X"0",X"0",X"0",X"C",X"E",X"E",X"E",X"C",X"F",X"B",X"2",X"0",X"8",X"C",X"8",
		X"0",X"0",X"0",X"0",X"8",X"C",X"C",X"C",X"F",X"B",X"A",X"8",X"8",X"6",X"6",X"6",
		X"0",X"0",X"0",X"0",X"0",X"8",X"8",X"B",X"B",X"B",X"8",X"8",X"6",X"6",X"6",X"0");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;