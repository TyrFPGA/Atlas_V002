
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller_rom2 is
generic
	(
		ADDR_WIDTH : integer := 15 -- Specify your actual ROM size to save LEs and unnecessary block RAM usage.
	);
port (
	clk : in std_logic;
	reset_n : in std_logic := '1';
	addr : in std_logic_vector(ADDR_WIDTH-1 downto 0);
	q : out std_logic_vector(31 downto 0);
	-- Allow writes - defaults supplied to simplify projects that don't need to write.
	d : in std_logic_vector(31 downto 0) := X"00000000";
	we : in std_logic := '0';
	bytesel : in std_logic_vector(3 downto 0) := "1111"
);
end entity;

architecture rtl of controller_rom2 is

	signal addr1 : integer range 0 to 2**ADDR_WIDTH-1;

	--  build up 2D array to hold the memory
	type word_t is array (0 to 3) of std_logic_vector(7 downto 0);
	type ram_t is array (0 to 2 ** ADDR_WIDTH - 1) of word_t;

	signal ram : ram_t:=
	(

     0 => (x"00",x"18",x"5c",x"54"),
     1 => (x"7f",x"7e",x"04",x"00"),
     2 => (x"00",x"00",x"05",x"05"),
     3 => (x"a4",x"bc",x"18",x"00"),
     4 => (x"00",x"7c",x"fc",x"a4"),
     5 => (x"04",x"7f",x"7f",x"00"),
     6 => (x"00",x"78",x"7c",x"04"),
     7 => (x"3d",x"00",x"00",x"00"),
     8 => (x"00",x"00",x"40",x"7d"),
     9 => (x"80",x"80",x"80",x"00"),
    10 => (x"00",x"00",x"7d",x"fd"),
    11 => (x"10",x"7f",x"7f",x"00"),
    12 => (x"00",x"44",x"6c",x"38"),
    13 => (x"3f",x"00",x"00",x"00"),
    14 => (x"00",x"00",x"40",x"7f"),
    15 => (x"18",x"0c",x"7c",x"7c"),
    16 => (x"00",x"78",x"7c",x"0c"),
    17 => (x"04",x"7c",x"7c",x"00"),
    18 => (x"00",x"78",x"7c",x"04"),
    19 => (x"44",x"7c",x"38",x"00"),
    20 => (x"00",x"38",x"7c",x"44"),
    21 => (x"24",x"fc",x"fc",x"00"),
    22 => (x"00",x"18",x"3c",x"24"),
    23 => (x"24",x"3c",x"18",x"00"),
    24 => (x"00",x"fc",x"fc",x"24"),
    25 => (x"04",x"7c",x"7c",x"00"),
    26 => (x"00",x"08",x"0c",x"04"),
    27 => (x"54",x"5c",x"48",x"00"),
    28 => (x"00",x"20",x"74",x"54"),
    29 => (x"7f",x"3f",x"04",x"00"),
    30 => (x"00",x"00",x"44",x"44"),
    31 => (x"40",x"7c",x"3c",x"00"),
    32 => (x"00",x"7c",x"7c",x"40"),
    33 => (x"60",x"3c",x"1c",x"00"),
    34 => (x"00",x"1c",x"3c",x"60"),
    35 => (x"30",x"60",x"7c",x"3c"),
    36 => (x"00",x"3c",x"7c",x"60"),
    37 => (x"10",x"38",x"6c",x"44"),
    38 => (x"00",x"44",x"6c",x"38"),
    39 => (x"e0",x"bc",x"1c",x"00"),
    40 => (x"00",x"1c",x"3c",x"60"),
    41 => (x"74",x"64",x"44",x"00"),
    42 => (x"00",x"44",x"4c",x"5c"),
    43 => (x"3e",x"08",x"08",x"00"),
    44 => (x"00",x"41",x"41",x"77"),
    45 => (x"7f",x"00",x"00",x"00"),
    46 => (x"00",x"00",x"00",x"7f"),
    47 => (x"77",x"41",x"41",x"00"),
    48 => (x"00",x"08",x"08",x"3e"),
    49 => (x"03",x"01",x"01",x"02"),
    50 => (x"00",x"01",x"02",x"02"),
    51 => (x"7f",x"7f",x"7f",x"7f"),
    52 => (x"00",x"7f",x"7f",x"7f"),
    53 => (x"1c",x"1c",x"08",x"08"),
    54 => (x"7f",x"7f",x"3e",x"3e"),
    55 => (x"3e",x"3e",x"7f",x"7f"),
    56 => (x"08",x"08",x"1c",x"1c"),
    57 => (x"7c",x"18",x"10",x"00"),
    58 => (x"00",x"10",x"18",x"7c"),
    59 => (x"7c",x"30",x"10",x"00"),
    60 => (x"00",x"10",x"30",x"7c"),
    61 => (x"60",x"60",x"30",x"10"),
    62 => (x"00",x"06",x"1e",x"78"),
    63 => (x"18",x"3c",x"66",x"42"),
    64 => (x"00",x"42",x"66",x"3c"),
    65 => (x"c2",x"6a",x"38",x"78"),
    66 => (x"00",x"38",x"6c",x"c6"),
    67 => (x"60",x"00",x"00",x"60"),
    68 => (x"00",x"60",x"00",x"00"),
    69 => (x"5c",x"5b",x"5e",x"0e"),
    70 => (x"86",x"fc",x"0e",x"5d"),
    71 => (x"ea",x"c2",x"7e",x"71"),
    72 => (x"c0",x"4c",x"bf",x"c8"),
    73 => (x"c4",x"1e",x"c0",x"4b"),
    74 => (x"c4",x"02",x"ab",x"66"),
    75 => (x"c2",x"4d",x"c0",x"87"),
    76 => (x"75",x"4d",x"c1",x"87"),
    77 => (x"ee",x"49",x"73",x"1e"),
    78 => (x"86",x"c8",x"87",x"e2"),
    79 => (x"ef",x"49",x"e0",x"c0"),
    80 => (x"a4",x"c4",x"87",x"eb"),
    81 => (x"f0",x"49",x"6a",x"4a"),
    82 => (x"c9",x"f1",x"87",x"f2"),
    83 => (x"c1",x"84",x"cc",x"87"),
    84 => (x"ab",x"b7",x"c8",x"83"),
    85 => (x"87",x"cd",x"ff",x"04"),
    86 => (x"4d",x"26",x"8e",x"fc"),
    87 => (x"4b",x"26",x"4c",x"26"),
    88 => (x"71",x"1e",x"4f",x"26"),
    89 => (x"cc",x"ea",x"c2",x"4a"),
    90 => (x"cc",x"ea",x"c2",x"5a"),
    91 => (x"49",x"78",x"c7",x"48"),
    92 => (x"26",x"87",x"e1",x"fe"),
    93 => (x"1e",x"73",x"1e",x"4f"),
    94 => (x"b7",x"c0",x"4a",x"71"),
    95 => (x"87",x"d3",x"03",x"aa"),
    96 => (x"bf",x"f0",x"d4",x"c2"),
    97 => (x"c1",x"87",x"c4",x"05"),
    98 => (x"c0",x"87",x"c2",x"4b"),
    99 => (x"f4",x"d4",x"c2",x"4b"),
   100 => (x"c2",x"87",x"c4",x"5b"),
   101 => (x"fc",x"5a",x"f4",x"d4"),
   102 => (x"f0",x"d4",x"c2",x"48"),
   103 => (x"c1",x"4a",x"78",x"bf"),
   104 => (x"a2",x"c0",x"c1",x"9a"),
   105 => (x"87",x"e7",x"ec",x"49"),
   106 => (x"4f",x"26",x"4b",x"26"),
   107 => (x"c4",x"4a",x"71",x"1e"),
   108 => (x"49",x"72",x"1e",x"66"),
   109 => (x"fc",x"87",x"f1",x"eb"),
   110 => (x"1e",x"4f",x"26",x"8e"),
   111 => (x"c3",x"48",x"d4",x"ff"),
   112 => (x"d0",x"ff",x"78",x"ff"),
   113 => (x"78",x"e1",x"c0",x"48"),
   114 => (x"c1",x"48",x"d4",x"ff"),
   115 => (x"c4",x"48",x"71",x"78"),
   116 => (x"08",x"d4",x"ff",x"30"),
   117 => (x"48",x"d0",x"ff",x"78"),
   118 => (x"26",x"78",x"e0",x"c0"),
   119 => (x"5b",x"5e",x"0e",x"4f"),
   120 => (x"f0",x"0e",x"5d",x"5c"),
   121 => (x"48",x"a6",x"c8",x"86"),
   122 => (x"bf",x"ec",x"78",x"c0"),
   123 => (x"c2",x"80",x"fc",x"7e"),
   124 => (x"78",x"bf",x"c8",x"ea"),
   125 => (x"bf",x"d0",x"ea",x"c2"),
   126 => (x"4c",x"bf",x"e8",x"4d"),
   127 => (x"bf",x"f0",x"d4",x"c2"),
   128 => (x"87",x"f9",x"e3",x"49"),
   129 => (x"f6",x"e8",x"49",x"c7"),
   130 => (x"c2",x"49",x"70",x"87"),
   131 => (x"87",x"cf",x"05",x"99"),
   132 => (x"bf",x"e8",x"d4",x"c2"),
   133 => (x"6e",x"b9",x"ff",x"49"),
   134 => (x"02",x"99",x"c1",x"99"),
   135 => (x"cb",x"87",x"c0",x"c2"),
   136 => (x"cf",x"cc",x"49",x"ee"),
   137 => (x"58",x"a6",x"d0",x"87"),
   138 => (x"d2",x"e8",x"49",x"c7"),
   139 => (x"05",x"98",x"70",x"87"),
   140 => (x"49",x"6e",x"87",x"c8"),
   141 => (x"c1",x"02",x"99",x"c1"),
   142 => (x"66",x"cc",x"87",x"c2"),
   143 => (x"7e",x"bf",x"ec",x"4b"),
   144 => (x"bf",x"f0",x"d4",x"c2"),
   145 => (x"87",x"f5",x"e2",x"49"),
   146 => (x"f3",x"cb",x"49",x"73"),
   147 => (x"02",x"98",x"70",x"87"),
   148 => (x"d4",x"c2",x"87",x"d7"),
   149 => (x"c1",x"49",x"bf",x"d0"),
   150 => (x"d4",x"d4",x"c2",x"b9"),
   151 => (x"da",x"fd",x"71",x"59"),
   152 => (x"49",x"ee",x"cb",x"87"),
   153 => (x"70",x"87",x"cd",x"cb"),
   154 => (x"e7",x"49",x"c7",x"4b"),
   155 => (x"98",x"70",x"87",x"d1"),
   156 => (x"87",x"c9",x"ff",x"05"),
   157 => (x"99",x"c1",x"49",x"6e"),
   158 => (x"87",x"c1",x"ff",x"05"),
   159 => (x"bf",x"f0",x"d4",x"c2"),
   160 => (x"c2",x"ba",x"c1",x"4a"),
   161 => (x"fc",x"5a",x"f4",x"d4"),
   162 => (x"c1",x"0a",x"7a",x"0a"),
   163 => (x"a2",x"c0",x"c1",x"9a"),
   164 => (x"87",x"fb",x"e8",x"49"),
   165 => (x"e6",x"49",x"da",x"c1"),
   166 => (x"a6",x"c8",x"87",x"e5"),
   167 => (x"c2",x"78",x"c1",x"48"),
   168 => (x"6e",x"48",x"e8",x"d4"),
   169 => (x"f0",x"d4",x"c2",x"78"),
   170 => (x"c7",x"c1",x"05",x"bf"),
   171 => (x"c0",x"c0",x"c8",x"87"),
   172 => (x"c8",x"d7",x"c2",x"4b"),
   173 => (x"49",x"15",x"4d",x"7e"),
   174 => (x"87",x"c3",x"e6",x"49"),
   175 => (x"c0",x"02",x"98",x"70"),
   176 => (x"b4",x"73",x"87",x"c2"),
   177 => (x"05",x"2b",x"b7",x"c1"),
   178 => (x"74",x"87",x"eb",x"ff"),
   179 => (x"99",x"ff",x"c3",x"49"),
   180 => (x"49",x"c0",x"1e",x"71"),
   181 => (x"74",x"87",x"d5",x"fb"),
   182 => (x"29",x"b7",x"c8",x"49"),
   183 => (x"49",x"c1",x"1e",x"71"),
   184 => (x"c8",x"87",x"c9",x"fb"),
   185 => (x"49",x"fd",x"c3",x"86"),
   186 => (x"c3",x"87",x"d4",x"e5"),
   187 => (x"ce",x"e5",x"49",x"fa"),
   188 => (x"87",x"d1",x"c8",x"87"),
   189 => (x"ff",x"c3",x"49",x"74"),
   190 => (x"2c",x"b7",x"c8",x"99"),
   191 => (x"9c",x"74",x"b4",x"71"),
   192 => (x"ff",x"87",x"df",x"02"),
   193 => (x"49",x"7e",x"bf",x"c8"),
   194 => (x"bf",x"ec",x"d4",x"c2"),
   195 => (x"a9",x"e0",x"c2",x"89"),
   196 => (x"87",x"c5",x"c0",x"03"),
   197 => (x"cf",x"c0",x"4c",x"c0"),
   198 => (x"ec",x"d4",x"c2",x"87"),
   199 => (x"c0",x"78",x"6e",x"48"),
   200 => (x"d4",x"c2",x"87",x"c6"),
   201 => (x"78",x"c0",x"48",x"ec"),
   202 => (x"99",x"c8",x"49",x"74"),
   203 => (x"87",x"ce",x"c0",x"05"),
   204 => (x"e4",x"49",x"f5",x"c3"),
   205 => (x"49",x"70",x"87",x"c9"),
   206 => (x"c0",x"02",x"99",x"c2"),
   207 => (x"ea",x"c2",x"87",x"ea"),
   208 => (x"c0",x"02",x"bf",x"cc"),
   209 => (x"c1",x"48",x"87",x"ca"),
   210 => (x"d0",x"ea",x"c2",x"88"),
   211 => (x"87",x"d3",x"c0",x"58"),
   212 => (x"c1",x"48",x"66",x"c4"),
   213 => (x"7e",x"70",x"80",x"e0"),
   214 => (x"c0",x"02",x"bf",x"6e"),
   215 => (x"ff",x"4b",x"87",x"c5"),
   216 => (x"c8",x"0f",x"73",x"49"),
   217 => (x"78",x"c1",x"48",x"a6"),
   218 => (x"99",x"c4",x"49",x"74"),
   219 => (x"87",x"ce",x"c0",x"05"),
   220 => (x"e3",x"49",x"f2",x"c3"),
   221 => (x"49",x"70",x"87",x"c9"),
   222 => (x"c0",x"02",x"99",x"c2"),
   223 => (x"ea",x"c2",x"87",x"f0"),
   224 => (x"48",x"7e",x"bf",x"cc"),
   225 => (x"03",x"a8",x"b7",x"c7"),
   226 => (x"6e",x"87",x"cb",x"c0"),
   227 => (x"c2",x"80",x"c1",x"48"),
   228 => (x"c0",x"58",x"d0",x"ea"),
   229 => (x"66",x"c4",x"87",x"d3"),
   230 => (x"80",x"e0",x"c1",x"48"),
   231 => (x"bf",x"6e",x"7e",x"70"),
   232 => (x"87",x"c5",x"c0",x"02"),
   233 => (x"73",x"49",x"fe",x"4b"),
   234 => (x"48",x"a6",x"c8",x"0f"),
   235 => (x"fd",x"c3",x"78",x"c1"),
   236 => (x"87",x"cb",x"e2",x"49"),
   237 => (x"99",x"c2",x"49",x"70"),
   238 => (x"87",x"e6",x"c0",x"02"),
   239 => (x"bf",x"cc",x"ea",x"c2"),
   240 => (x"87",x"c9",x"c0",x"02"),
   241 => (x"48",x"cc",x"ea",x"c2"),
   242 => (x"d0",x"c0",x"78",x"c0"),
   243 => (x"4a",x"66",x"c4",x"87"),
   244 => (x"6a",x"82",x"e0",x"c1"),
   245 => (x"87",x"c5",x"c0",x"02"),
   246 => (x"73",x"49",x"fd",x"4b"),
   247 => (x"48",x"a6",x"c8",x"0f"),
   248 => (x"fa",x"c3",x"78",x"c1"),
   249 => (x"87",x"d7",x"e1",x"49"),
   250 => (x"99",x"c2",x"49",x"70"),
   251 => (x"87",x"ed",x"c0",x"02"),
   252 => (x"bf",x"cc",x"ea",x"c2"),
   253 => (x"a8",x"b7",x"c7",x"48"),
   254 => (x"87",x"c9",x"c0",x"03"),
   255 => (x"48",x"cc",x"ea",x"c2"),
   256 => (x"d3",x"c0",x"78",x"c7"),
   257 => (x"48",x"66",x"c4",x"87"),
   258 => (x"70",x"80",x"e0",x"c1"),
   259 => (x"02",x"bf",x"6e",x"7e"),
   260 => (x"4b",x"87",x"c5",x"c0"),
   261 => (x"0f",x"73",x"49",x"fc"),
   262 => (x"c1",x"48",x"a6",x"c8"),
   263 => (x"c3",x"48",x"74",x"78"),
   264 => (x"7e",x"70",x"98",x"f0"),
   265 => (x"c0",x"05",x"98",x"48"),
   266 => (x"da",x"c1",x"87",x"ce"),
   267 => (x"87",x"cf",x"e0",x"49"),
   268 => (x"99",x"c2",x"49",x"70"),
   269 => (x"87",x"d0",x"c2",x"02"),
   270 => (x"c3",x"49",x"ee",x"cb"),
   271 => (x"a6",x"d0",x"87",x"f6"),
   272 => (x"c4",x"ea",x"c2",x"58"),
   273 => (x"c2",x"50",x"c0",x"48"),
   274 => (x"bf",x"97",x"c4",x"ea"),
   275 => (x"87",x"d8",x"c1",x"05"),
   276 => (x"cd",x"c0",x"05",x"6e"),
   277 => (x"49",x"da",x"c1",x"87"),
   278 => (x"87",x"e3",x"df",x"ff"),
   279 => (x"c1",x"02",x"98",x"70"),
   280 => (x"bf",x"e8",x"87",x"c6"),
   281 => (x"ff",x"c3",x"49",x"4b"),
   282 => (x"2b",x"b7",x"c8",x"99"),
   283 => (x"d4",x"c2",x"b3",x"71"),
   284 => (x"ff",x"49",x"bf",x"f0"),
   285 => (x"cc",x"87",x"c6",x"da"),
   286 => (x"c3",x"c3",x"49",x"66"),
   287 => (x"02",x"98",x"70",x"87"),
   288 => (x"c2",x"87",x"c6",x"c0"),
   289 => (x"c1",x"48",x"c4",x"ea"),
   290 => (x"c4",x"ea",x"c2",x"50"),
   291 => (x"c0",x"05",x"bf",x"97"),
   292 => (x"49",x"73",x"87",x"d6"),
   293 => (x"05",x"99",x"f0",x"c3"),
   294 => (x"c1",x"87",x"c7",x"ff"),
   295 => (x"de",x"ff",x"49",x"da"),
   296 => (x"98",x"70",x"87",x"dd"),
   297 => (x"87",x"fa",x"fe",x"05"),
   298 => (x"c2",x"48",x"a6",x"cc"),
   299 => (x"78",x"bf",x"cc",x"ea"),
   300 => (x"cc",x"49",x"66",x"cc"),
   301 => (x"48",x"66",x"c4",x"91"),
   302 => (x"7e",x"70",x"80",x"71"),
   303 => (x"c0",x"02",x"bf",x"6e"),
   304 => (x"cc",x"4b",x"87",x"c6"),
   305 => (x"0f",x"73",x"49",x"66"),
   306 => (x"c0",x"02",x"9d",x"75"),
   307 => (x"02",x"6d",x"87",x"e9"),
   308 => (x"6d",x"87",x"e4",x"c0"),
   309 => (x"e6",x"dd",x"ff",x"49"),
   310 => (x"c1",x"49",x"70",x"87"),
   311 => (x"cb",x"c0",x"02",x"99"),
   312 => (x"4b",x"a5",x"c4",x"87"),
   313 => (x"bf",x"cc",x"ea",x"c2"),
   314 => (x"0f",x"4b",x"6b",x"49"),
   315 => (x"c0",x"02",x"85",x"c8"),
   316 => (x"05",x"6d",x"87",x"c5"),
   317 => (x"c8",x"87",x"dc",x"ff"),
   318 => (x"c8",x"c0",x"02",x"66"),
   319 => (x"cc",x"ea",x"c2",x"87"),
   320 => (x"cf",x"f0",x"49",x"bf"),
   321 => (x"26",x"8e",x"f0",x"87"),
   322 => (x"26",x"4c",x"26",x"4d"),
   323 => (x"00",x"4f",x"26",x"4b"),
   324 => (x"00",x"00",x"00",x"00"),
   325 => (x"00",x"00",x"00",x"10"),
   326 => (x"14",x"11",x"12",x"58"),
   327 => (x"23",x"1c",x"1b",x"1d"),
   328 => (x"94",x"91",x"59",x"5a"),
   329 => (x"f4",x"eb",x"f2",x"f5"),
   330 => (x"00",x"00",x"00",x"00"),
   331 => (x"00",x"00",x"00",x"00"),
   332 => (x"00",x"00",x"00",x"00"),
   333 => (x"ff",x"4a",x"71",x"1e"),
   334 => (x"72",x"49",x"bf",x"c8"),
   335 => (x"4f",x"26",x"48",x"a1"),
   336 => (x"bf",x"c8",x"ff",x"1e"),
   337 => (x"c0",x"c0",x"fe",x"89"),
   338 => (x"a9",x"c0",x"c0",x"c0"),
   339 => (x"c0",x"87",x"c4",x"01"),
   340 => (x"c1",x"87",x"c2",x"4a"),
   341 => (x"26",x"48",x"72",x"4a"),
   342 => (x"1e",x"73",x"1e",x"4f"),
   343 => (x"e6",x"c1",x"4b",x"c0"),
   344 => (x"50",x"c0",x"48",x"c0"),
   345 => (x"bf",x"d8",x"d7",x"c2"),
   346 => (x"c1",x"e3",x"fe",x"49"),
   347 => (x"05",x"98",x"70",x"87"),
   348 => (x"d6",x"c2",x"87",x"c4"),
   349 => (x"e6",x"c1",x"4b",x"cc"),
   350 => (x"50",x"c1",x"48",x"c0"),
   351 => (x"bf",x"dc",x"d7",x"c2"),
   352 => (x"e9",x"e2",x"fe",x"49"),
   353 => (x"26",x"48",x"73",x"87"),
   354 => (x"00",x"4f",x"26",x"4b"),
   355 => (x"5f",x"43",x"42",x"47"),
   356 => (x"53",x"4f",x"49",x"42"),
   357 => (x"4e",x"49",x"42",x"2e"),
   358 => (x"74",x"6f",x"6e",x"20"),
   359 => (x"75",x"6f",x"66",x"20"),
   360 => (x"6f",x"20",x"64",x"6e"),
   361 => (x"44",x"53",x"20",x"6e"),
   362 => (x"72",x"61",x"63",x"20"),
   363 => (x"00",x"00",x"00",x"64"),
   364 => (x"5f",x"43",x"42",x"47"),
   365 => (x"53",x"4f",x"49",x"42"),
   366 => (x"00",x"4e",x"49",x"42"),
   367 => (x"4f",x"54",x"55",x"41"),
   368 => (x"54",x"4f",x"4f",x"42"),
   369 => (x"00",x"00",x"42",x"47"),
   370 => (x"11",x"14",x"12",x"58"),
   371 => (x"23",x"1c",x"1b",x"1d"),
   372 => (x"91",x"94",x"59",x"5a"),
   373 => (x"f4",x"eb",x"f2",x"f5"),
   374 => (x"00",x"00",x"25",x"b0"),
   375 => (x"00",x"00",x"25",x"bc"),
   376 => (x"00",x"00",x"1a",x"13"),
		others => (others => x"00")
	);
	signal q1_local : word_t;

	-- Altera Quartus attributes
	attribute ramstyle: string;
	attribute ramstyle of ram: signal is "no_rw_check";

begin  -- rtl

	addr1 <= to_integer(unsigned(addr(ADDR_WIDTH-1 downto 0)));

	-- Reorganize the read data from the RAM to match the output
	q(7 downto 0) <= q1_local(3);
	q(15 downto 8) <= q1_local(2);
	q(23 downto 16) <= q1_local(1);
	q(31 downto 24) <= q1_local(0);

	process(clk)
	begin
		if(rising_edge(clk)) then 
			if(we = '1') then
				-- edit this code if using other than four bytes per word
				if (bytesel(3) = '1') then
					ram(addr1)(3) <= d(7 downto 0);
				end if;
				if (bytesel(2) = '1') then
					ram(addr1)(2) <= d(15 downto 8);
				end if;
				if (bytesel(1) = '1') then
					ram(addr1)(1) <= d(23 downto 16);
				end if;
				if (bytesel(0) = '1') then
					ram(addr1)(0) <= d(31 downto 24);
				end if;
			end if;
			q1_local <= ram(addr1);
		end if;
	end process;
  
end rtl;

