/* hello.c − Hello World kernel module
∗
∗ Demonstrates module in itialization, module release and printk.
∗
∗ (Adapted fromvarious example modules including those found in the
∗ LinuxKernel Programming Guide, LinuxDeviceDrivers book and
∗ FSM’s device driver tutorial)
*/
#include <linux/module.h> /* Needed by all modules */
#include<linux/kernel.h> /* Needed for KERN_∗ and printk */
#include<linux/init.h> /* Needed for __init and __exit macros */
/* This function is run uponmodule load. This is where you setup data
  structures and reserve resources used by the module.*/
static int __init my_init(void) {
/* Linux kernel’s version of printf */
printk(KERN_INFO "Hello world!\n");
// A non 0 return means init module failed; module can’t be loaded.
return 0;
}
/* This function is run just prior to the module’s removal from the
system. You should release ALL resources used by your module
here (otherwise be prepared for a reboot). */
static void __exit my_exit(void) {
printk(KERN_ALERT "Goodbye world!\n");
}
/* These define info that can be displayed by modinfo*/
MODULE_LICENSE ("GPL");
MODULE_AUTHOR("ECEN449 Student (and others)");
MODULE_DESCRIPTION ("Simple Hello World Module");
/* Here we define which functions we want to use for initialization
and clean up*/
module_init(my_init);
module_exit(my_exit);
