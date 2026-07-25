class DataType{
 	public static void main(String a[]){
 	//byte b = 128; // limit till 127 for byte so it shows error while compiling.
	//short b = 32768; // limit till 32768 for short so it shows error while compiling.



        // typecasting

	//byte b = (byte) 128; //type casting in byte. 
	short b = (short) 32768; //typr casting in short.


	int n = b; // type casting to int. from short to int.
	System.out.println(n);


       // int z ;  
       // System.out.println(z); this gives error as the z is not defined. its only initialised. not declared.
	}
}


/* -128,-127,-126 ...........0..........126,127 
 after 127 the cycle start and value from -128 will be taken. 
*/