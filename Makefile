NAME 	:= 	badiret
CC		:=	gcc
AS		:=	gcc
OBJCOPY	:=	objcopy
CFLAGS	:=	-O0 -std=c11 -fno-builtin -nostartfiles -nostdlib -masm=intel -m64 -mabi=sysv -mcmodel=large -fno-asynchronous-unwind-tables -fPIE -pie
SFLAGS	:=	-nostartfiles -nostdlib -fno-asynchronous-unwind-tables -fPIE -pie
LFLAGS	:=	$(LDIRS) -T linker.ld -Wl,--build-id=none -fno-asynchronous-unwind-tables -fPIE -pie
CFILES	:=	$(wildcard *.c)
SFILES	:=	$(wildcard *.S)
OBJS	:=	$(patsubst %.c, %.o, $(CFILES)) $(patsubst %.S, %.o, $(SFILES))

TARGET = $(NAME).bin

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LFLAGS) -o $(NAME).elf *.o
	$(OBJCOPY) -O binary $(NAME).elf $(TARGET)
	#rm -f temp.t

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

%.o: %.S
	$(AS) -c -o $@ $< $(SFLAGS)

.PHONY: clean

clean:
	rm -f $(TARGET) *.o *.elf *.js
