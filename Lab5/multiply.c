#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <asm/io.h>

#include "xparameters.h"

#define PHY_ADDR XPAR_MULTIPLY2_0_S00_AXI_BASEADDR
#define MEMSIZE XPAR_MULTIPLY2_0_S00_AXI_HIGHADDR - XPAR_MULTIPLY2_0_S00_AXI_BASEADDR+1

void* virt_addr;

static int __init my_init(void) {
  printk(KERN_INFO "Mapping Virtual Address...\n");
  virt_addr = ioremap(PHY_ADDR,MEMSIZE);
  printk(KERN_INFO "Writing a 7 to register 0\n");
  iowrite32(7, virt_addr + 0);
  printk(KERN_INFO "Writing a 2 to register 1\n");
  iowrite32(2, virt_addr + 4);
  
  printk("Read %d from register 0\n", ioread32(virt_addr + 0));
  printk("Read %d from register 1\n", ioread32(virt_addr + 4));
  printk("Read %d from register 2\n", ioread32(virt_addr + 8));
  printk("Printing the physical address of multiplication peripheral: %i\n", PHY_ADDR);
  printk("Printing the  virtual address of multiplication peripheral: %p\n", virt_addr);
  
  return 0;
}

static void __exit my_exit(void) {
  printk(KERN_ALERT "unmapping virtual address space...\n");
  iounmap((void*)virt_addr);
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("ECE449 Student (Samuel Fafel)");
MODULE_DESCRIPTION("Simple multiplier module");

module_init(my_init);
module_exit(my_exit);
