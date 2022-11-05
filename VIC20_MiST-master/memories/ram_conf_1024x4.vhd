----------------------------------------------------------------------------------
--
-- Description:
-- RAM 1024 x 4 bit: sync. write, sync. read, configurable
--
-- (c) copyright 2011...2013 by Wolfgang Scherr
-- http://www.pin4.at - ws_arcade <at> pin4.at
--
-- All Rights Reserved
--
-- Version 1.0
-- SVN: $Id: ram_conf_1024x4.vhd 647 2014-05-17 11:47:04Z wolfgang.scherr $
--
-------------------------------------------------------------------------------
-- Redistribution and use in source or synthesized forms are permitted
-- provided that the following conditions are met (or a prior written
-- permission was given otherwise):
--
-- * Redistributions of source code must retain this original header
--   incl. author, contributors, conditions, copyright and disclaimer.
--
-- * Redistributions in synthesized (binary) form must also contain
--   the soure code according to this conditions to keep it "open".
--
-- * Neither the name of the author nor the names of contributors may
--   be used to endorse or promote products derived from this code.
--
-- * This code is only allowed to be used on:
--   - Replay hardware (from fpgaarcade.com)
--
-- * Feedback or bug reports are welcome, but please check on the 
--   web sites given in the header first for any updates available.
--
-- * You are responsible for any legal issues arising from your use
--   or your own distribution of this code.
----------------------------------------------------------------------
-- THIS CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
-- "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
-- LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
-- FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- AUTHOR OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
-- INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
-- SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS  CODE OR ANY WORK
-- PRODUCTS, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram_conf_1024x4 is
  generic (
    START_AI    : std_logic_vector(5 downto 0) := "000000"
  );
  port (
    CLK         : in  std_logic;
    CLK_EN      : in  std_logic;
    -- standard channel (read/write)
    ENn         : in  std_logic;
    WRn         : in  std_logic;
    ADDR        : in  std_logic_vector(9 downto 0);
    DIN         : in  std_logic_vector(3 downto 0);
    DOUT        : out std_logic_vector(3 downto 0);
    -- setup bus (write only, starts at START_AI)
    CONF_WR     : in  std_logic;
    CONF_AI     : in  std_logic_vector(15 downto 0);
    CONF_DI     : in  std_logic_vector(7 downto 0)
    );
end ram_conf_1024x4;

architecture RTL of ram_conf_1024x4 is

  type ram_arr_t is array(1023 downto 0) of std_logic_vector(3 downto 0);
  signal ram_s : ram_arr_t := (others => "0101"); -- most likely init value of real RAM

  signal read_en_s : std_logic;
  signal write_en_s : std_logic;
  signal conf_en_s : std_logic;
  signal adr_s : std_logic_vector(ADDR'left downto 0);
  signal dat_s : std_logic_vector(3 downto 0);

begin

  read_en_s <= CLK_EN and NOT(ENn);
  sync_read : process(CLK)
  begin
    if rising_edge(CLK) then
      if read_en_s='1' then
        DOUT <= ram_s(TO_INTEGER(unsigned(ADDR)));
      --else
      --  DOUT <= (OTHERS => '0');
      end if;
    end if;
  end process sync_read;

  write_en_s <= CLK_EN and NOT(ENn) and NOT(WRn);
  conf_en_s <= '1' when CONF_WR='1' and (CONF_AI(15 DOWNTO 15-START_AI'left)=START_AI) else '0';
  adr_s <= CONF_AI(ADDR'left downto 0) when CONF_WR='1' else ADDR;
  dat_s <= CONF_DI(3 downto 0) when CONF_WR='1' else DIN;
  sync_conf_write : process(CLK)
  begin
    if rising_edge(CLK) then
      if write_en_s='1' or conf_en_s='1' then
        ram_s(TO_INTEGER(unsigned(adr_s))) <=dat_s;
      end if;
    end if;
  end process sync_conf_write;

end RTL;
