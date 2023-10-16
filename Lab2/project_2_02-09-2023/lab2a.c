#include <xparameters.h>
#include <xgpio.h>
#include <xstatus.h>
#include <xilprintf.h>
/∗ Definitions ∗/
#define GPIO_DEVICE_ID XPAR_LED_DEVICE_ID /∗ GPIO device that LEDs are connected to ∗/
#define WAIT_VAL 10000000

int delay(void);
int main() {
	int count;
	int count_masked;
XGpio l e d s ;
i n t s t a t u s ;
s t a t u s = X G p i o I n i t i a l i z e (& l e d s , GPIO DEVICE ID ) ;
X G pi o S et D at a Di r e cti o n (& l e d s , 1 , 0 x00 ) ;
i f ( s t a t u s != XST SUCCESS ) {
x i l p r i n t f ( ‘ ‘ I n i t i a l i z a t i o n f a i l e d ‘ ‘ ) ;
}
c o u nt = 0;
w hil e ( 1 )
{
c o u nt m a s k e d = c o u nt & 0xF ;
X G pi o Di s c r et eW rit e (& l e d s , 1 , c o u nt m a s k e d ) ;
x i l p r i n t f ( ‘ ‘ Val ue o f LEDs = 0 x%x\n\ r ’ ’ , c o u nt m a s k e d ) ;
d e l a y ( ) ;
c o u nt ++;
}
r e t u r n ( 0 ) ;
}