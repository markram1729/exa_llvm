ROOT = .
BIN_DIR = $(ROOT)/../llvm_build/bin
CXX = $(BIN_DIR)/clang++

neo.ll : *.cpp
	$(CXX) -S $^ -o $@

neoemit.ll:*.cpp
	$(CXX) -S -emit-llvm $^ -o $@
dot : neoemit.ll
	$(BIN_DIR)/opt -dot-dom neoemit.ll -disable-output

llc.x86 : neo.ll
	$(BIN_DIR)/opt $^ -march=x86 -o $@
disbale_o.ll : *.cpp
	$(BIN_DIR)/clang++ -Xclang -disable-O0-optnone -S -emit-llvm $^ -o $@
mem3reg.ll : disbale_o.ll
	$(BIN_DIR)/opt -S -mem2reg disable_o.ll -o $@
c :
	rm neo.ll
cemit : 
	rm neoemit.ll
