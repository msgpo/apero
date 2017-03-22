/* Hello World program */

extern void treeos()
{

  char *display_ptr = (char *) 0xb8000;
  char *text = "Barev Apero!";
  int i;
  for (i = 0; i < 4000; i++) {
    display_ptr[i] = (char)0x0;
  }

  int j = 1988;
  for (i = 0; i < 12; i++) {
    display_ptr[j] = (char) 0x2;
    display_ptr[j+1] = (char) 0x2;
    display_ptr[j] = text[i];
    j+=2;
  }

  while(1){}
}
