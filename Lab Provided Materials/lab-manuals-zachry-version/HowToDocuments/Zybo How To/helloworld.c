
#include <stdio.h>
#include "platform.h"
#include <xparameters.h>
#include "multiply.h"
#include "xil_printf.h"
#include "xil_io.h"

int main()
{
    init_platform();

    int i;
    for(i = 1; i <=16; i++)
    {
        MULTIPLY_mWriteReg(XPAR_MULTIPLY_0_S00_AXI_BASEADDR, MULTIPLY_S00_AXI_SLV_REG0_OFFSET, i);
        MULTIPLY_mWriteReg(XPAR_MULTIPLY_0_S00_AXI_BASEADDR, MULTIPLY_S00_AXI_SLV_REG1_OFFSET, i);
        xil_printf("%x, ", MULTIPLY_mReadReg(XPAR_MULTIPLY_0_S00_AXI_BASEADDR, MULTIPLY_S00_AXI_SLV_REG2_OFFSET));
    }
    xil_printf("\n");

    cleanup_platform();
    return 0;
}
