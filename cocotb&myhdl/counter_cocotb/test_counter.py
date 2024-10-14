# test_counter.py
import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer

@cocotb.test()
async def test_counter(dut):
    """Test the counter module."""

    # Start the clock
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())

    # Reset the counter
    dut.reset.value = 1
    await RisingEdge(dut.clk)
    dut.reset.value = 0

    # Check the counter values
    for i in range(10):
        await RisingEdge(dut.clk)
        assert dut.count.value == i % 16, f"Counter value is incorrect: {dut.count.value}"

    print("Test passed!")