PROJECT=boot_cpu
CPU ?= cortex-m3
BOARD ?= stm32vldiscovery

qemu:
gdb:
	arm-none-eabi-as -mthumb -mcpu=$(CPU) -ggdb -c boot_cpu.s -o boot_cpu.o
	arm-none-eabi-ld -Tmap.ld boot_cpu.o -o boot_cpu.elf
	arm-none-eabi-objdump -D -S boot_cpu.elf > boot_cpu.elf.lst
	arm-none-eabi-readelf -a boot_cpu.elf > boot_cpu.elf.debug
	qemu-system-arm -S -M $(BOARD) -cpu $(CPU) -nographic -kernel $(PROJECT).elf -gdb tcp::1234

gdb:
	gdb-multiarch -q $(PROJECT).elf -ex "target remote localhost:1234"

clean:
	rm -rf *.out *.elf .gdb_history *.lst *.debug *.o