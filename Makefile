CC = xtensa-esp108-elf-gcc
CXX = xtensa-esp108-elf-g++
AR = xtensa-esp108-elf-ar
OBJCOPY = xtensa-esp108-elf-objcopy
SYSROOT = $(shell $(CC) --print-sysroot)
SYSROOT_HEADERS = $(SYSROOT)/usr/include
CFLAGS = -I. -Iuser -Istltest \
            -I$(SYSROOT_HEADERS)/lwip         \
            -I$(SYSROOT_HEADERS)/lwip/ipv4    \
            -I$(SYSROOT_HEADERS)/lwip/ipv6    \
            -I$(SYSROOT_HEADERS)/espressif    \
            -ffunction-sections -fdata-sections -nostdlib -mlongcalls -mtext-section-literals
CXXFLAGS = $(CFLAGS) -fno-rtti -fno-exceptions -std=gnu++11
LD       := $(CXX)
LDLIBS = -nostdlib -Wl,--start-group -lmain -lfreertos -lnet80211 -lwpa -llwip -lpp -lphy -lcrypto -lhal -lrtc -lstdc++port -lstdc++ -lc -lnewlibport -lm  -Wl,--end-group -lgcc
LDSCRIPT = pro.map1.1.ld
LDROMSCRIPT = pro.rom.addr.ld
LDDIR = $(SYSROOT)/usr/lib
LDFLAGS = -T$(LDSCRIPT) -T$(LDROMSCRIPT) -nostdlib -Wl,--no-check-sections -u call_user_start -Wl,-static -Wl,-gc-sections

%1/%.o: %.c
	$(CC) $(CFLAGS) -std=gnu90 -c $$< -o $$@

%1/%.o: %.cpp
	$(CXX) $(CXXFLAGS)  -c $$< -o $$@

src = stltest/swprnge1.cpp \
stltest/setintr1.cpp \
stltest/setunon2.cpp \
stltest/set2.cpp \
stltest/nequal.cpp \
stltest/iota1.cpp \
stltest/ptrbinf2.cpp \
stltest/equal2.cpp \
stltest/parsrt1.cpp \
stltest/bitset1.cpp \
stltest/logicnot.cpp \
stltest/filln1.cpp \
stltest/max2.cpp \
stltest/negate.cpp \
stltest/map1.cpp \
stltest/ptrbinf1.cpp \
stltest/setdiff1.cpp \
stltest/pair1.cpp \
stltest/rotcopy1.cpp \
stltest/parsrtc2.cpp \
stltest/incl2.cpp \
stltest/rndshuf1.cpp \
stltest/prevprm2.cpp \
stltest/plus.cpp \
stltest/adjdiff0.cpp \
stltest/bind1st1.cpp \
stltest/unegate1.cpp \
stltest/replace0.cpp \
stltest/uprbnd2.cpp \
stltest/advance.cpp \
stltest/vec5.cpp \
stltest/inplmrg1.cpp \
stltest/dummy.cpp \
stltest/gener1.cpp \
stltest/rndshuf0.cpp \
stltest/setunon1.cpp \
stltest/nextprm1.cpp \
stltest/modulus.cpp \
stltest/genern2.cpp \
stltest/trnsfrm1.cpp \
stltest/min1.cpp \
stltest/revcopy1.cpp \
stltest/times.cpp \
stltest/func2.cpp \
stltest/list2.cpp \
stltest/uprbnd1.cpp \
stltest/bind2nd2.cpp \
stltest/remif1.cpp \
stltest/adjdiff1.cpp \
stltest/logicor.cpp \
stltest/lwrbnd1.cpp \
stltest/foreach0.cpp \
stltest/count0.cpp \
stltest/inrprod2.cpp \
stltest/alg5.cpp \
stltest/iter4.cpp \
stltest/sort1.cpp \
stltest/findif0.cpp \
stltest/stat.cpp \
stltest/unique2.cpp \
stltest/findif1.cpp \
stltest/hset2.cpp \
stltest/foreach1.cpp \
stltest/pair2.cpp \
stltest/revbit1.cpp \
stltest/maxelem1.cpp \
stltest/repcpif1.cpp \
stltest/merge2.cpp \
stltest/bvec1.cpp \
stltest/adjfind1.cpp \
stltest/insert2.cpp \
stltest/find1.cpp \
stltest/string1.cpp \
stltest/incl1.cpp \
stltest/merge1.cpp \
stltest/reverse1.cpp \
stltest/rndshuf2.cpp \
stltest/divides.cpp \
stltest/adjfind2.cpp \
stltest/search0.cpp \
stltest/iter3.cpp \
stltest/remcpif1.cpp \
stltest/bind2nd1.cpp \
stltest/vec3.cpp \
stltest/rawiter.cpp \
stltest/mset5.cpp \
stltest/unegate2.cpp \
stltest/replif1.cpp \
stltest/countif1.cpp \
stltest/eqlrnge1.cpp \
stltest/vec7.cpp \
stltest/copy1.cpp \
stltest/alg1.cpp \
stltest/ptrunf1.cpp \
stltest/lexcmp1.cpp \
stltest/greateq.cpp \
stltest/remove1.cpp \
stltest/deque1.cpp \
stltest/nthelem1.cpp \
stltest/vec8.cpp \
stltest/copyb0.cpp \
stltest/stack1.cpp \
stltest/replcpy1.cpp \
stltest/replace1.cpp \
stltest/func1.cpp \
stltest/uniqcpy1.cpp \
stltest/finsert2.cpp \
stltest/swap1.cpp \
stltest/mset4.cpp \
stltest/prevprm1.cpp \
stltest/bind1st2.cpp \
stltest/adjdiff2.cpp \
stltest/uniqcpy2.cpp \
stltest/inrprod0.cpp \
stltest/pheap2.cpp \
stltest/minelem1.cpp \
stltest/accum2.cpp \
stltest/finsert1.cpp \
stltest/copy2.cpp \
stltest/hmmap1.cpp \
stltest/iterswp0.cpp \
stltest/genern1.cpp \
stltest/vec4.cpp \
stltest/ptition1.cpp \
stltest/eqlrnge2.cpp \
stltest/setdiff2.cpp \
stltest/stl_test.cpp \
stltest/mset1.cpp \
stltest/setintr0.cpp \
stltest/mkheap0.cpp \
stltest/stblsrt2.cpp \
stltest/setintr2.cpp \
stltest/vec1.cpp \
stltest/logicand.cpp \
stltest/reviter1.cpp \
stltest/lesseq.cpp \
stltest/list1.cpp \
stltest/trnsfrm2.cpp \
stltest/fill1.cpp \
stltest/parsrtc1.cpp \
stltest/gener2.cpp \
stltest/stack2.cpp \
stltest/nextprm0.cpp \
stltest/setdiff0.cpp \
stltest/partsum2.cpp \
stltest/list4.cpp \
stltest/mismtch2.cpp \
stltest/ptition0.cpp \
stltest/partsum1.cpp \
stltest/equal0.cpp \
stltest/remcopy1.cpp \
stltest/mmap2.cpp \
stltest/incl0.cpp \
stltest/revbit2.cpp \
stltest/ostmit.cpp \
stltest/binsrch1.cpp \
stltest/rotate0.cpp \
stltest/reviter2.cpp \
stltest/binsrch2.cpp \
stltest/sort2.cpp \
stltest/rotcopy0.cpp \
stltest/accum1.cpp \
stltest/parsrtc0.cpp \
stltest/minus.cpp \
stltest/parsrt2.cpp \
stltest/greater.cpp \
stltest/inplmrg2.cpp \
stltest/minelem2.cpp \
stltest/pheap1.cpp \
stltest/nthelem0.cpp \
stltest/lexcmp2.cpp \
stltest/alg3.cpp \
stltest/vec6.cpp \
stltest/stblsrt1.cpp \
stltest/alg2.cpp \
stltest/mismtch0.cpp \
stltest/equalto.cpp \
stltest/ptrunf2.cpp \
stltest/max1.cpp \
stltest/queue1.cpp \
stltest/pqueue1.cpp \
stltest/count1.cpp \
stltest/less.cpp \
stltest/mismtch1.cpp \
stltest/lwrbnd2.cpp \
stltest/iter1.cpp \
stltest/stblptn1.cpp \
stltest/partsum0.cpp \
stltest/equal1.cpp \
stltest/iterswp1.cpp \
stltest/mmap1.cpp \
stltest/bnegate1.cpp \
stltest/maxelem2.cpp \
stltest/search2.cpp \
stltest/merge0.cpp \
stltest/min2.cpp \
stltest/copyb.cpp \
stltest/inrprod1.cpp \
stltest/prevprm0.cpp \
stltest/pair0.cpp \
stltest/setsymd2.cpp \
stltest/stblptn0.cpp \
stltest/unique1.cpp \
stltest/copy3.cpp \
stltest/setsymd1.cpp \
stltest/search1.cpp \
stltest/vec2.cpp \
stltest/hmset1.cpp \
stltest/func3.cpp \
stltest/iter2.cpp \
stltest/parsrt0.cpp \
stltest/setsymd0.cpp \
stltest/binsert1.cpp \
stltest/eqlrnge0.cpp \
stltest/copy4.cpp \
stltest/insert1.cpp \
stltest/adjfind0.cpp \
stltest/binsert2.cpp \
stltest/list3.cpp \
stltest/mkheap1.cpp \
stltest/nthelem2.cpp \
stltest/setunon0.cpp \
stltest/find0.cpp \
stltest/alg4.cpp \
stltest/partsrt0.cpp \
stltest/rotate1.cpp \
stltest/set1.cpp \
stltest/nextprm2.cpp \
stltest/mset3.cpp \
stltest/bnegate2.cpp \
user/user_main.cpp 

obj := $(src:.c=.o)
obj := $(obj:.cpp=.o)

sgitests-bins: sgitests
	echo "Run objcopy, please wait..."
	@$(OBJCOPY) --only-section .text -O binary $< eagle.app.v7.text.bin
	@$(OBJCOPY) --only-section .data -O binary $< eagle.app.v7.data.bin
	@$(OBJCOPY) --only-section .rodata -O binary $< eagle.app.v7.rodata.bin
	@$(OBJCOPY) --only-section .irom0.text -O binary $< eagle.app.v7.irom0text.bin
	@$(OBJCOPY) --only-section .drom0.text -O binary $< eagle.app.v7.drom0text.bin
	rm -f irom0_flash.bin irom1.bin
	echo "objcopy done"
	echo "launching gen_appbin"
	gen_appbin.py $< $(LDDIR)/$(LDSCRIPT) 0 0 . .
	echo "Done"

sgitests: sgitests.a
	$(CC) $(LDFLAGS) -Wl,-Map=$@.map -Wl,--start-group $(LDLIBS) $^ -Wl,--end-group -o $@

sgitests.a: $(obj)
	$(AR) cru $@ $^

flash: sgitests-0x1000.bin
	esptool.py write_flash 0x1000 sgitests-0x01000.bin

clean:
	rm -f sgitests.map sgitests.a sgitests $(obj) *.bin user.ota

