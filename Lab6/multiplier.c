#include <linux/module.h>  
#include <linux/moduleparam.h> 
#include <linux/kernel.h>  
#include <linux/init.h>	 
#include <linux/fs.h>	 
#include <linux/sched.h>   
#include <linux/slab.h>
#include <asm/io.h> 
#include <asm/uaccess.h>  
#include "xparameters.h" 

// Define constants for the device name and buffer length
#define DEVICE_NAME "multiplier"
#define BUF_LEN 80

// Function declarations
int init_module(void);
void cleanup_module(void);
static int device_open(struct inode *, struct file *);
static int device_release(struct inode *, struct file *);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
static ssize_t device_write(struct file *, const char *, size_t, loff_t *);

// Declare variables for the major number and device status
static int Major;

// Define the file operations for the driver
static struct file_operations fops = {
	.read = device_read,
	.write = device_write,
 	.open = device_open,
	.release = device_release
};

// Define constants for the physical address and memory size of the device
#define PHY_ADDR XPAR_MULTIPLY2_0_S00_AXI_BASEADDR
#define MEMSIZE XPAR_MULTIPLY2_0_S00_AXI_HIGHADDR - XPAR_MULTIPLY2_0_S00_AXI_BASEADDR+1

// Declare a variable for the virtual address of the device
void* virt_addr; 

// The module initialization function
static int __init my_init(void) {
	// Map the physical address to a virtual address
	printk(KERN_INFO "Mapping virtual address...\n");
	virt_addr = ioremap(PHY_ADDR, MEMSIZE);
	printk("Physical Address: 0x%i\n", PHY_ADDR);
	printk("Virtual Address: 0x%p\n", virt_addr);

	// Register the character device driver
	Major = register_chrdev(0, DEVICE_NAME, &fops); 
	if (Major < 0) {
		printk(KERN_ALERT "Registering char device failed with %d\n", Major);
		return Major;
	}

	// Print information about the registered device
	printk(KERN_INFO "Registered a device with dynamic Major number of %d\n", Major);
	printk(KERN_INFO "Create a device file for this device with this command:\n'mknod /dev/%s c %d 0'.\n", DEVICE_NAME, Major);

	return 0;
}

// called when the module is unloaded from the kernel
static void __exit my_cleanup(void) { 
	unregister_chrdev(Major, DEVICE_NAME); // unregisters the character device
	printk(KERN_ALERT "unmapping virtual address space...\n");
	iounmap((void*)virt_addr); // unmaps the virtual address
}

// called when the device file is opened and prints confirmation
static int device_open(struct inode *inode, struct file *file) {
	printk(KERN_ALERT "Device has been opened\n");
	return 0;
}

// called when the device file is closed (released) and prints confirmation
static int device_release(struct inode *inode, struct file *file) {
	printk(KERN_ALERT "Device has been closed\n");
	return 0;
}

// called when the program reads from the device file
static ssize_t device_read(struct file *filp, char *buffer, size_t length, loff_t * offset) {
	int bytes_read = 0;

	int* kernelBuffer = (int*)kmalloc(length * sizeof(int), GFP_KERNEL);
	kernelBuffer[0] = ioread32(virt_addr);  //reads data from the registers at the corresponding address
	kernelBuffer[1] = ioread32(virt_addr + 4); // and stores in the buffer
	kernelBuffer[2] = ioread32(virt_addr + 8);
	char* kernelBuff = (char*)kernelBuffer; 

	int i;
	for (i = 0; i < length; i++) { 
		put_user(*(kernelBuff++), buffer++); // copies the data to the user buffer
		bytes_read++;
	}

	kfree(kernelBuffer); // frees the kernel buffer
	//printk("bytes_read: %d\n", bytes_read);
	return bytes_read;
}

// called when the program writes to the device file
static ssize_t device_write(struct file *filp, const char *buff, size_t len, loff_t * off) {
	char* kernelBuffer = (char*)kmalloc((len + 1) * sizeof(char), GFP_KERNEL);

	int i;
	for (i = 0; i < len; i++) {
		get_user(kernelBuffer[i], buff++); // reads data from the user buffer, stores in kernel buffer
	}
	
	kernelBuffer[len] = '\0'; // add terminating character

	int* intBuffer = (int*)kernelBuffer; // converted into an integer buffer
	
	// values of the first and second integers in the buffer are written to the hardware
	printk(KERN_INFO "Writing %d to register 0\n", intBuffer[0]);
	iowrite32(intBuffer[0], virt_addr + 0); 
	
	printk(KERN_INFO "Writing %d to register 1\n", intBuffer[1]);
	iowrite32(intBuffer[1], virt_addr + 4);
	
	kfree(intBuffer); // integer buffer is freed
	return i; // returns number of bytes written
}

MODULE_LICENSE("GPL");
MODULE_AUTHOR("ECEN 449 Student (and others)");
MODULE_DESCRIPTION("Module which creates a character device and allows user interaction with it");

module_init(my_init);
module_exit(my_cleanup);
