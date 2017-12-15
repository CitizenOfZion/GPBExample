# GPBExample
Working of GPB with example

Protocol Buffers - Code Example

This directory contains example code that uses Protocol Buffers to manage an address book. Two programs are provided for each supported language. The add_person example adds a new person to an address book, prompting the user to input the person's information. The list_people example lists people already in the address book. The examples use the exact same format in all three languages, so you can, for example, use add_person_java to create an address book and then use list_people_python to read it.

These examples are part of the Protocol Buffers tutorial, located at: https://developers.google.com/protocol-buffers/docs/tutorials

Build the example using make

You must install the protobuf package before you can build it using make. The minimum requirement is to install protocol compiler (i.e., the protoc binary) and the protobuf runtime for the language you want to build.

You can simply run "make" to build the example for all languages (except for Go). However, since different language has different installation requirement, it will likely fail. It's better to follow individual instrutions below to build only the language you are interested in.

C++

Then run "make cpp" in this examples directory to build the C++ example. It will create two executables: Serialize_obj and Deserialize_obj. These programs simply take an address book file as their parameter. The add_person_cpp programs will create the file if it doesn't already exist.

To run the examples:

$ ./Serialize_obj addressbook.data #To add entries to addressbook

$ ./Deserialize_obj addressbook.data #To display entries in addressbook

Note that on some platforms you may have to edit the Makefile and remove "-lpthread" from the linker commands (perhaps replacing it with something else). We didn't do this automatically because we wanted to keep the example simple.
