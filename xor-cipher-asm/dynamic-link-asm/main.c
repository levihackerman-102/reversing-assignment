
#include <stdio.h>

extern int singlechar_xor(char* input_bytes, char key_value, char* output);

char input_bytes[100];
char key_value;
char output[100];

int main(int argc, char* argv[])
{
	printf("%s","Input the string to be encrypted : ");
    scanf("%[^\n]%*c", input_bytes);
    printf("%s","Input the key : ");
	scanf("%c", &key_value);

	singlechar_xor(input_bytes, key_value, output);
    printf("The encrypted string is : ");
	printf("%s\n", output);
	
	return 0;
}
