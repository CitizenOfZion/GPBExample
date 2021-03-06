.PHONY: all cpp clean

all: cpp 

cpp:    SerializeAddress_obj  DeSerializeAddress_obj

clean:
	rm -f add_person_cpp list_people_cpp add_person_java list_people_java add_person_python list_people_python
	rm -f javac_middleman AddPerson*.class ListPeople*.class com/example/tutorial/*.class
	rm -f protoc_middleman addressbook.pb.cc addressbook.pb.h addressbook_pb2.py com/example/tutorial/AddressBookProtos.java
	rm -f *.pyc
	rm -f protoc_middleman_go tutorial/*.pb.go add_person_go list_people_go
	rmdir tutorial 2>/dev/null || true
	rmdir com/example/tutorial 2>/dev/null || true
	rmdir com/example 2>/dev/null || true
	rmdir com 2>/dev/null || true

protoc_middleman: addressbook.proto
	protoc $$PROTO_PATH --cpp_out=. addressbook.proto
	@touch protoc_middleman

SerializeAddress_obj: SerializeAddress.cpp protoc_middleman
	pkg-config --cflags protobuf  # fails if protobuf is not installed
	c++ SerializeAddress.cpp addressbook.pb.cc -o SerializeAddress_obj `pkg-config --cflags --libs protobuf`

DeSerializeAddress_obj: DeSerializeAddress.cpp protoc_middleman
	pkg-config --cflags protobuf  # fails if protobuf is not installed
	c++ DeSerializeAddress.cpp addressbook.pb.cc -o DeSerializeAddress_obj `pkg-config --cflags --libs protobuf`
